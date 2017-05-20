#!/usr/bin/env perl
# 
# Replace one or more "{search\D}" placeholders in one or more URLs with a
# search query, where D is the URL's space delimiter.
# 
# E.g.:
#   "https://duckduckgo.com/?q={search\+}&iax=1&ia=images" "earth's biosphere"
#     => https://duckduckgo.com/?q=earth%27s+biosphere&iax=1&ia=images
# 
# A URL may contain up to eight {search\D} placeholders to allow multiple
# search queries (e.g. start and end locations for travel directions) or to
# copy them within itself. The search query used by each placeholder
# corresponds to its position in the URL by default. If a search query for
# a placeholder does not exist, the placeholder will be replaced with an empty
# string.
# 
# Placeholder options can be used to change and modify the search query used
# by a placeholder. They are specified with a bang ("!") and placed right
# before the delimiter specifier. They are the following:
# 
#   !<P>:    Use search query at position P in arguments (e.g. {search!3\D})
#   !W<P>:   Use only word at position P in the search query; will work for
#            multiple words (e.g. {search!W2!W5!W6\+})
#   !U[P]:   Make word at position P (or all words if P is omitted) in the
#            search query upper case (e.g. {search!U1!U3\+});
#   !C:      Capitalize all words in the search query
#   !R:      Reverse all words in the search query
#   !M:      Remove all commas in the search query
# 
# Unsafe characters in a URL will be encoded. A character can be escaped with
# two backslashes to keep it from being encoded.
# 
# Multiple URLs:
#   Multiple URLs can be passed in at once. They must be passed in the first
#   argument and delimited by "<|>". Each of their {search\D} placeholders will
#   be replaced with the same search queries (exepct those using the !<P>
#   option). The parsed URLs will be returned as a single string in the same
#   format (delimited by "<|>").
# 
# "<>" delimiters:
#   This script was created mainly as a utility for other scripts. For this
#   reason, it takes into account "<>" delimiters in between the URL "<|>"
#   delimiters which can be used to pass important data with the URLs.
#   Everything after the first occurrence of a "<>" delimiter is left as is and
#   the string befor is considered the URL. The return string will be in the
#   same format (i.e. "url1[<>data1<>data2...]<|>url2[<>data1<>data2...]<|>
#   url3...").
# 
# Arguments:
#   1.   One or more URLs delimited by "<|>"
#   2-?. One or more search queries delimited by $SEARCH_QUERY_DELIM; they can
#        be passed in any number of arguments (as all arguments after the first
#        are joined).
# 

use strict;
use warnings;
use URI::Escape;

# ======= CONFIGURATIONS ======================

# Delimiter used to separate search queries
my $SEARCH_QUERY_DELIM='%%';

# Maximum number of {search\D} placeholders allowed per URL
my $MAX_SEARCH_PLACEHOLDERS_PER_URL = 8;

# ======= ! CONFIGURATIONS ======================

# ASCII escape ranges for search queries; discludes [#$%&=?_\s] (to include
# these except for \s, use '\x00-\x1F\x21-\x2D\x3B-\x40\x5B-\x60\x7B-\xFF')
my $SRCH_QRY_ASCII_ESCP_RNGS = '\x00-\x1F\x21\x22\x24\x27-\x2D\x3B\x3C
    \x3E\x40\x5B-\x5E\x60\x7B-\xFF';
# ASCII escape ranges for all other parts of the URL
my $URI_ASCII_ESCP_RNGS = $SRCH_QRY_ASCII_ESCP_RNGS.'\x20';

if (@ARGV < 1) {
  print 'error_: invalid number of arguments: '.scalar @ARGV."\n";
  exit 1;
}

# Remove leading "<|>" delimiters (including surrounding spaces) as they cause
# empty array elements to be created at the beginning of the array.
$ARGV[0] =~ s/^(\s*<|>\s*)*//;

my @ARG_URLS_W_DATA = split(/<\|>/, $ARGV[0]);
if (scalar @ARG_URLS_W_DATA == 0) {
  exit;
}

shift @ARGV;
my $ARG_SEARCH_QUERIES = join(' ', @ARGV);
$ARG_SEARCH_QUERIES =~ s/^\s+|\s+$//g;

# Remove leading search query delimiters (including surrounding spaces) so there
# are no empty search queries at the beginning. This means the first non-empty
# search query is shifted to the first position. Empty search queries after it
# are allowed.
$ARG_SEARCH_QUERIES =~ s/^(\s*$SEARCH_QUERY_DELIM\s*)*//;

my @SEARCH_QUERIES = split(/\s*$SEARCH_QUERY_DELIM\s*/, $ARG_SEARCH_QUERIES);

# Utility function to escape a section of a URL.
sub escapeUrlUtil {
  my $url = ${(shift)};
  my $uriEscpRngs = ${(shift)};

  my @urlParts = split(/\\\\/, $url);
  my $retStr = uri_escape($urlParts[0], $uriEscpRngs);

  if (scalar @urlParts > 1) {
    for my $indx (1..$#urlParts) {
      my $urlPart = $urlParts[$indx];

      my $frstChar = substr($urlPart, 0, 1);
      my $remChars = substr($urlPart, 1, length($urlPart));

      $retStr .= $frstChar.uri_escape($remChars, $uriEscpRngs);
    }
  }

  return $retStr;
}

for my $i (0..$MAX_SEARCH_PLACEHOLDERS_PER_URL) {
  if (defined($SEARCH_QUERIES[$i])) {
    $SEARCH_QUERIES[$i] = escapeUrlUtil(\$SEARCH_QUERIES[$i],
        \$SRCH_QRY_ASCII_ESCP_RNGS);
  } else {
    # Initialize all non-existing search queries to an empty string so that
    # corresponding {search\D} placeholders can be replaced with one
    $SEARCH_QUERIES[$i] = '';
  }
}

my $returnStr;

for my $urlWData (@ARG_URLS_W_DATA) {
  my ($url) = $urlWData =~ /(.*?(?=<>)|.*)/;
  my ($urlData) = $urlWData =~ /(<>.*)/;
  my $srchPlhNo;
  my $urlEndPos = 0;
  my $fnlUrl;

  while ($url =~ /(.*?)({search([^\\]*)(?:\\([^}]*))})/g) {
    my ($txtBefr, $plh, $opts, $spcDelim) = ($1, $2, $3, $4);
    my $optSrchQryPos;
    my @optOnlyWrdsPos;
    my @optUpprCaseWrdsPos;
    my $optCptlz;
    my $optRevrs;
    my $optRemCommas;

    if ($opts ne '') {
      if ($opts !~ m/^(!([0-9]{1,2}|[WU][0-9]{0,2}|[CRM]))+$/) {
        print "error: one or more\n  invalid options in placeholder\n  $plh;\n",
            "  URL:\n  $url\n";
        exit 1;
      }

      while ($opts =~ /!([0-9]{1,2}|[WU][0-9]{0,2}|[CRM])/g) {
        my $opt = $1;

        if ($opt =~ qr/^[0-9]{1,2}$/) {
          if ($opt < 1 || $opt > $MAX_SEARCH_PLACEHOLDERS_PER_URL) {
            print "error: search query\n  position $opt in placeholder\n ",
                " $plh\n  out of range; valid range is",
                " 1-$MAX_SEARCH_PLACEHOLDERS_PER_URL;\n  URL:\n  $url\n";
            exit 1;
          }

          $optSrchQryPos = $opt;
        } elsif ($opt =~ qr/^W([0-9]{0,2})$/) {
            if ($1 ne '') {
              push @optOnlyWrdsPos, $1 - 1;
            } else {
              print "error: position P\n  missing for option \"!W[P]\" in\n ",
                  " placeholder $plh\n  URL:\n  $url\n";
              exit 1;
            }
        } elsif ($opt =~ qr/^U([0-9]{0,2})$/) {
            if ($1 ne '') {
              push @optUpprCaseWrdsPos, $1 - 1;
            } else {
              $optUpprCaseWrdsPos[0] = -2;
            }
        } elsif ($opt eq 'C') {
          $optCptlz = 1;
        } elsif ($opt eq 'R') {
          $optRevrs = 1;
        } elsif ($opt eq 'M') {
          $optRemCommas = 1;
        }
      }
    }

    $srchPlhNo++;

    if ($srchPlhNo == 1 && $txtBefr eq '') {
      print "error: {search\\D}\n  placeholder cannot be at the very\n ",
          " beginning of a URL; URL:\n  $url\n";
      exit 1;
    } elsif ($spcDelim eq '') {
      print "error: delimiter D\n  missing for {search\\D} placeholder;\n ",
          " URL:\n  $url\n";
      exit 1;
    } elsif (length($spcDelim) > 7) {
      print "error: delimiter D\n  for {search\\D} placeholder too long;\n ",
          " Length: ".length($spcDelim)."\n  Delimiter: \"$spcDelim\"\n ",
          " URL:\n  $url\n";
      exit 1;
    } elsif ($srchPlhNo > $MAX_SEARCH_PLACEHOLDERS_PER_URL) {
      print "error: cannot use\n  more than $MAX_SEARCH_PLACEHOLDERS_PER_URL",
          " {search\\D}\n  placeholders; URL:\n  $url\n";
      exit 1;
    }

    $urlEndPos = $+[0];

    $fnlUrl .= escapeUrlUtil(\$txtBefr, \$URI_ASCII_ESCP_RNGS);

    my $srchQryIndx;

    if (defined($optSrchQryPos)) {
      $srchQryIndx = $optSrchQryPos - 1;
    } else {
      $srchQryIndx = $srchPlhNo - 1;
    }

    my $srchQry = $SEARCH_QUERIES[$srchQryIndx];

    if (@optOnlyWrdsPos) {
      my @srchQryWrds = $srchQry =~ /\S+\s*/g;
      $srchQry = '';
      for my $pos (@optOnlyWrdsPos) {
        if ($pos > scalar @srchQryWrds - 1) {
          next;
        }
        $srchQry .= $srchQryWrds[$pos];
      }
      $srchQry =~ s/\s+$//g;
    }

    if (@optUpprCaseWrdsPos) {
      if ($optUpprCaseWrdsPos[0] == -2) {
        $srchQry = uc($srchQry);
      } else {
        my @srchQryWrds = $srchQry =~ /\S+\s*/g;
        for my $pos (@optUpprCaseWrdsPos) {
          if ($pos > scalar @srchQryWrds - 1) {
            next;
          }
          $srchQryWrds[$pos] = uc($srchQryWrds[$pos]);
        }
        $srchQry = join('', @srchQryWrds);
      }
    }

    if ($optCptlz) {
      $srchQry =~ s/\b(\w)/\U$1/g;
    }

    if ($optRevrs) {
      $srchQry = join('', reverse split(/(\s+)/, $srchQry));
    }

    if ($optRemCommas) {
      $srchQry =~ s/%2C//g;
    }

    $srchQry =~ s/\s/$spcDelim/g;

    $fnlUrl .= $srchQry;
  }

  my $urlEnd = substr($url, $urlEndPos);
  if ($urlEnd ne '') {
    $fnlUrl .= escapeUrlUtil(\$urlEnd, \$URI_ASCII_ESCP_RNGS);
  }

  my $fnlStr = ($urlData) ? "$fnlUrl$urlData" : $fnlUrl;
  $returnStr .= "$fnlStr<|>";
}

print substr($returnStr, 0, -3)."\n";

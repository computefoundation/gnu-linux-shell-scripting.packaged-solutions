#!/usr/bin/env perl
# 
# URL aliases file parser for webutil. Searches for the given aliases and
# returns their URLs with all configuration options.
# 
# Arguments:
#   1. Directory where URL aliases files are stored
#   2. URL aliases files delimited by a vertical bar ("|")
#   3. URL aliases to match
# 
# Return string:
#   Returns an empty string if none of the aliases were found in the file.
#   Returns a non-empty string otherwise, being either the final formatted 
#   string or an error in the url aliases file.
# 
#   Format (double spaces and newlines added just for clarity):
#     [alias1_opt1[<>alias1_opt2]<$>]URL1[<>opt1[<>opt2]]
#     [  <|>URL2[<>opt1[<>opt2]]  [<|>URL3[<>opt1[<>opt2]]  ...]  ]
#     [ <&>
#     (alias 2; everything above the previous line)
#     ...]
# 
#   Example (newlines added just for clarity):
#     browser=term2<>dump+12<$>
#     https://en.wikipedia.org/w/index.php?search={search/+}
#     <|>https://www.washingtonpost.com/newssearch/?query={search/%20}<>dump+20
#     <|>https://www.wikidata.org/wiki/Wikidata:Main_Page<>broswer=gui1
#     <&>
#     browser=gui4<$>
#     http://www.thefreedictionary.com/{search\+}
#     <&>
#     https://www.codecademy.com/articles/glossary-html
#     <|>http://www.simplehtmlguide.com/cheatsheet.php
# 
#   At least one URL will always be returned for an alias as each requires at
#   least one.
# 

use strict;
use warnings;

# ======= CONFIGURATIONS ======================

# Maximum number of URLs allowed per alias.
my $MAX_URLS_PER_ALIAS = 40;

# ======= ! CONFIGURATIONS ======================

if (scalar @ARGV < 2) {
  print "error: invalid number of arguments: ".@ARGV."\n";
  exit 1;
} elsif (scalar @ARGV < 3) {
  exit;
}

my $URL_ALIASES_FILES_DIR = $ARGV[0];
my @URL_ALIASES_FILES = split(/\|/, $ARGV[1]);
shift @ARGV for 1..2;
my @ARG_URL_ALIASES = @ARGV;

# parseOptions:
#   Parse options for an alias or a URL.
sub parseOptions {
  my $optionsStr = shift;
  my $urlAliasesFile = shift;
  my $lineNo = shift;
  my @options = split(/\s+/, $optionsStr);
  my ($optName, $frmtdOpt, $frmtdOpts) = ('');

  for my $opt (@options) {
    if ($opt =~ m/^(%(browser)(?:=(.*)|$))/) {
      $optName = $2;
      my ($all, $optVal) = ($1, $3);

      if (!$optVal) {
        print "error:\n  $urlAliasesFile:\n  no value given for option",
            " %browser\n  on line $lineNo (use %browser=gui<1-9>\n  or",
            " %browser=term<1-7>)\n";
        exit 1;
      }

      if ($optVal !~ m/^(gui[1-9]|term[1-7])$/) {
        print "error:\n  $urlAliasesFile:\n  invalid value \"$optVal\" for",
            " option\n  %browser on line $lineNo; allowed\n  values are",
            " \"gui<1-9>\" and \"term<1-7>\"\n";
        exit 1;
      }

      $frmtdOpt = "browser=$optVal";
    } elsif ($opt =~ m/(^%((dump)(?:\+(\d+(?:\.\d)?))?)(.*))/) {
      $optName = $3;
      my ($all, $intOrDec, $rmnTxt) = ($1, $4, $5);

      if ($rmnTxt && $rmnTxt !~ m/^[p]/) {
        print "error:\n  $urlAliasesFile:\n  invalid format for option\n ",
            " %dump on line $lineNo\n";
        exit 1;
      }

      $frmtdOpt = 'dump';
      if ($intOrDec) {
        if ($intOrDec > 300) {
          print "error:\n  $urlAliasesFile:\n  page forward value $intOrDec",
              " for\n  option %dump on line $lineNo\n  is too large (max: ",
              " 300).\n";
          exit 1;
        }
        $frmtdOpt .= '+'.$intOrDec;
      }
    } else {
      $opt =~ m/(.*)/;
      print "error:\n  $urlAliasesFile:\n  invalid option on line $lineNo:\n ",
          " \"$1\"";
      if ($opt !~ m/^%/) {
        print "\n  options must begin with \"%\"\n";
      }
      exit 1;
    }

    if ($frmtdOpts && $frmtdOpts =~ m/$optName/) {
      print "error:\n  $urlAliasesFile:\n  option %$optName specified more\n ",
          " than once on line $lineNo\n";
      exit 1;
    }

    $frmtdOpts .= '<>'.$frmtdOpt;
  }

  if ($frmtdOpts) {
    $frmtdOpts = substr($frmtdOpts, 2);

    if ($frmtdOpts =~ m/dump/ && $frmtdOpts =~ m/browser=(.*)/) {
      if ($1 =~ m/^(gui.)/) {
        print "error:\n  $urlAliasesFile:\n  line $lineNo: GUI value not",
            " allowed\n  for option %browser with option\n  %dump; must use",
            " value \"term<1-7>\"\n";
        exit 1;
      }
    }
  }

  return $frmtdOpts;
}

# A URL must contain at least one dot or colon so that all remaining aliases
# after the one matched will not be interpreted as URLs.
my $URL_REGEX = qr/
  [-A-Za-z0-9+&@#\/%?=~_|()\[\]{}\\*\$'"!,;]+[:.]
  [-A-Za-z0-9+&@#\/%?=~_|()\[\]{}\\*\$'"!:,.;]*
  [-A-Za-z0-9+&@#\/%=~_|()\[\]{}'"]/x;

my $RETURN_STRING;

my $urlAliasesFileNo;
my @filehandlers;

for my $argUrlAlias (@ARG_URL_ALIASES) {
  my $aliasRetStr;

  FILES_LOOP: for $urlAliasesFileNo (0..$#URL_ALIASES_FILES) {
    my $urlAliasesFile;
    my $fh;
    if (scalar @filehandlers > $urlAliasesFileNo) {
      $fh = $filehandlers[$urlAliasesFileNo];
      seek $fh, 0, 0;
    } else {
      $urlAliasesFile = $URL_ALIASES_FILES[$urlAliasesFileNo];
      my $path = "$URL_ALIASES_FILES_DIR/$urlAliasesFile";
      open($fh, '<', $path) or die "Failed to open file '$path': $!\n";
      push @filehandlers, $fh;
    }

    my $lineNo;
    
    while (<$fh>) {
      $lineNo++;
      if ($_ =~ m/^\s*($|')/) {
        next;
      }

      if ($_ =~ m/^\s*(\S+\|\S*|\S*\|\S+)(?:\s+(.*)|\s*$)/) {
        my ($lineAliases, $options) = ($1, $2);

        if ($lineAliases =~ qr'\.|:|<|>') {
          print "error:\n  $urlAliasesFile:\n  line $lineNo: alias names",
              " cannot\n  contain dots, colons or angle\n  brackets\n";
          exit 1;
        }

        my %lineAliases = map { $_ => 1 } split('\|', $lineAliases);
        
        if (exists($lineAliases{$argUrlAlias})) {
          if ($options) {
            $aliasRetStr .= parseOptions($options, $urlAliasesFile, $lineNo)
                .'<$>';
          }

          my $aliasesLineNo = $lineNo;
          my $urlsRetStr;
          my $urlsCnt;

          while (<$fh>) {
            $lineNo++;
            if ($_ =~ m/^\s*(?!')(${URL_REGEX})(?:\s+(.*)|$)/) {
              my ($url, $options) = ($1, $2);
              $urlsRetStr .= ($urlsCnt) ? '<|>'.$url : $url;
              if ($options) {
                $urlsRetStr .= '<>'.parseOptions($options, $urlAliasesFile,
                    $lineNo);
              }

              (($urlsCnt++))
            } elsif ($_ =~ m/^\s*($|')/) {
              next;
            } elsif ($_ =~ m/^\s*(\S+\|\S*|\S*\|\S+)/) {
              last;
            } else {
              $_ =~ m/^(\S*)(?:\s+(.*)|$)/;
              print "error:\n  $urlAliasesFile:\n  URL on line $lineNo for",
                  " alias(es)\n  \"$lineAliases\" is either\n  in an unallowed",
                  " format or contains\n  unallowed characters. URLs must",
                  " contain\n  at least one dot or colon and not begin\n  or",
                  " end with one; unallowed characters\n  include the",
                  " following: ^ ` < > \n";
              exit 1;
            }
          }

          if ($urlsRetStr) {
            if ($urlsCnt > $MAX_URLS_PER_ALIAS) {
              print "error:\n  $urlAliasesFile:\n  line $aliasesLineNo: too",
                  " many URLs for\n  alias \"$argUrlAlias\": $urlsCnt",
                  " (max:\n  $MAX_URLS_PER_ALIAS; value can be changed in\n ",
                  " url-aliases-parser.pl)\n";
              exit 1;
            }

            $aliasRetStr .= $urlsRetStr.'<&>';
          } else {
            print "error:\n  $urlAliasesFile:\n  alias \"$argUrlAlias\" on",
                " line\n  $aliasesLineNo does not have any URLs\n";
            exit 1;
          }

          last FILES_LOOP;
        } # !if argument alias matches line alias

      } elsif ($_ !~ m/^\s*(?!')(${URL_REGEX})(?:\s+(.*)|$)/) {
        print "error:\n  $urlAliasesFile:\n  line $lineNo does not contain a",
            " valid alias\n  or URL. Alias names must have a vertical\n  bar",
            " (\"|\") before or after them. URLs must\n  contain at least one",
            " dot or colon and not\n  begin or end with one; unallowed URL\n ",
            " characters include the following:\n    ^ ` < > \n";
        exit 1;
      }
    } #!while <fh>
  } #!for URL aliases files

  if ($aliasRetStr) {
    $RETURN_STRING .= $aliasRetStr;
  } else {
    last;
  }
}

if ($RETURN_STRING) {
  $RETURN_STRING = substr($RETURN_STRING, 0, -3);
  print $RETURN_STRING."\n";
}

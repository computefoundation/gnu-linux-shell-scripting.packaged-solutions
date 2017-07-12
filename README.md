
<p align='center'>
  <img src='https://raw.githubusercontent.com/linux-shell-base/linux-shell-base/images/logo-light.png' width='32%' alt='logo-light.png'>
</p>
</br>

**Packaged-utilities** is an extension of [linux-shell-base][linux-shell-base] for utilities consisting of more than one file.

Each utility is stored in its own directory.

## _global/

*Dependencies for packaged utilities.*

* [**url-search-placeholder-parser.pl**][url-search-placeholder-parser.pl]: Replace one or more "{search\D}" placeholders in one or more URLs with a search query, where D is the URL's space delimiter.

## Locate/

Locate a file or directory from a database.

<img src='/../images/gold-star.png' width='2.5%' align='right' disabled='true'>

## Webutil/

Open one or more URLs by alias, search query or directly.

## Xselwebutil/

Search the selected text in a browser (using a search URL) or open all space separated words within the selected text beginning with "www.", "http[s]://", "ftp://" or "file://" as URLs. This utility should be bound to a keybinding.



[linux-shell-base]: https://github.com/linux-shell-base/linux-shell-base

[url-search-placeholder-parser.pl]: https://github.com/linux-shell-base/packaged-utilities/blob/master/_global/url-search-placeholder-parser.pl

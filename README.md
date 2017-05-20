
**packaged-utilities** is an extension of [linux-shell-base][linux-shell-base] for utilities made up of two or more files. These utilities conform to a low-level methodology just as those in **linux-shell-base**.

# Content

## _global/

Dependencies for packaged utilities.

* **url-search-placeholder-parser.pl**: Replace one or more "{search\D}" placeholders in one or more URLs with a search query, where D is the URL's space delimiter.

## locate/

Locate a file or directory from a database.

## webutil/

Open one or more URLs by alias in one of multiple browsers.

## xselwebutil/

Search the selected text in a browser (using a search URL), or open all space separated words within the selected text beginning with "www.", "http[s]://", "ftp://" or "file://" as URLs. This utility should be bound to a keybinding.


[linux-shell-base]: https://github.com/linux-shell-base/linux-shell-base

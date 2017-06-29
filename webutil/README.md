
# Webutil

Open one or more URLs by alias, search query or directly in one of multiple web browsers.

Four methods of passing arguments are allowed to open URLs:

1. An alias *(first argument)* with one or more optional search queries *(remaining arguments)*.
2. Multiple aliases *(first N arguments)* with one or more optional search queries *(all arguments after the last matching alias)*; requires switch `-a`.
3. A search query (when the first argument does not match any alias [configurable] or if alias matching is overridden with switch `-s`). *The default search URL used for the search query is defined in webutil.*
4. Strings opened directly as URLs if the first begins with "www.", "http[s]://", "ftp://" or "file://".

Documentation on aliases is provided at the top of [*url-aliases*][url-aliases].

## Examples

*Note: Quotes are not required and are used here only for clarity.*

### Alias

Search "currency converter" with a search engine URL aliased by "search".

```bash
webutil "search" "currency converter"
```

Search "outdoor gear" with multiple business/store locator websites aliased by "business-locators" in GUI browser 3.

```bash
webutil -3 "business-locators" "outdoor gear"
```

Search directions from Phoenix, AZ to Seattle, WA with a maps search URL aliased by "dir".

```bash
webutil "dir" "phoenix, az %% seattle, wa"
```

### Multiple aliases

Search "novelty items" in three different online stores aliased by "store1," "store2" and "store3".

```bash
webutil store1 store2 store3 novelty items
```

---

*These aliases are predefined in url-aliases and can be used right away.*

### Default search URL

Search "How to make tamales" with the default search URL.

```bash
webutil How to make tamales
```

### URLs opened directly

Open wikipedia.com and the page for swarm robotics on scholarpedia.org directly.

```bash
webutil "www.wikipedia.com" "http://www.scholarpedia.org/article/Swarm_robotics"
```

## Features

* Use up to 9 GUI and 7 terminal browsers/brower commands.
* Dump each URL's output to a terminal window.
* Specify a configuration option *(e.g. open in GUI browser 3)* per alias or URL (see *url-aliases* for information).



[url-aliases]: https://github.com/linux-shell-base/packaged-utilities/blob/master/webutil/url-aliases

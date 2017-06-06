
# Webutil

Open one or more URLs by alias in one of multiple browsers.

Documentation on aliases and URLs is provided at the top of [*url-aliases*][url-aliases].

## Examples

*Note: The quotes are not required (unless a string contains special bash characters) and are only used for clarity.*

Open all URLs aliased by "search," passing in "currency converter" as each URLs search query.

```bash
webutil "search" "currency converter"
```

Open all URLs aliased by "my-cities" in GUI browser #2, passing in "specialty hardware" as each URLs search query.

```bash
webutil -2 "my-cities" "specialty hardware"
```

Open the URL aliased by "dir," passing in "phoenix, az" and "seattle, wa" as the URL's search queries.

```bash
webutil "dir" "phoenix, az %% seattle, wa"
```

*Note: These aliases are pre-defined in url-aliases and can be tested right away.*

Open all arguments directly as URLs if the first begins with "www.", "http[s]://", "ftp://" or "file://".

```bash
webutil "www.wikipedia.com" "https://en.wikipedia.org/wiki/History_of_science"
```

## Features

* Use up to 9 GUI and 7 terminal browsers.
* Dump output to a terminal window.
* Specify a browser or dump option per alias or URL (see *url-aliases* for info).



[url-aliases]: https://github.com/linux-shell-base/packaged-utilities/blob/master/webutil/url-aliases

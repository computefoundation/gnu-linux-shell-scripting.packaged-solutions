
# Webutil

Open one or more URLs by alias in one of multiple browsers.

Documentation on aliases and URLs is provided at the top of url-aliases.

## Examples

Open all URLs aliased by "search," passing in "currency converter" as each URLs search query.

*note: quotes are not required (unless a string contains special bash characters).*

```bash
webutil "search" "currency converter"
```

Open all URLs aliased by "stores," passing in "specialty hardware" as each URLs search query.

```bash
webutil "stores" "specialty hardware"
```

Open the URL aliased by "dir," passing in "phoenix, az" and "seattle, wa" as the URL's search query.

```bash
webutil "dir" "phoenix, az %% seattle, wa"
```

Open all arguments directly as URLs if the first begins with "www.", "http[s]://", "ftp://" or "file://".

```bash
webutil "www.wikipedia.com" "https://en.wikipedia.org/wiki/History_of_science"
```

## Features

* Use up to 9 GUI and 7 terminal browsers.
* Dump output to a terminal window.
* Specify a browser and the dump option per alias or URL (see url-aliases file for info).

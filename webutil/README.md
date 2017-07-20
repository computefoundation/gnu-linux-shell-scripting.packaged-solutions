
# Webutil

Open one or more URLs by alias, search query or directly in a web browser.

This utility supports multiple web browsers.

Four argument methods are allowed:

1. An alias (first argument) with one or more optional search queries (remaining arguments).
2. Multiple aliases (first N arguments) with one or more optional search queries (remaining arguments after the last matching alias). (Requires switch `-a`).
3. A search query with the default search URL *(defined in webutil)* when the first argument does not match any alias *(configurable)* or with switch `-s`.
4. Strings beginning with "http[s]://", "ftp://" or "file://" or ending with the top level domain ".com", ".org", ".edu", ".gov", ".uk" or ".net" *(can be adjusted)*.

Configurations are defined in [webutil](webutil) and aliases are defined in [url-aliases](url-aliases).

## Examples

### 1. Alias

Search ...

"ancient egypt" with the URL for wikipedia aliased by "wiki."

```bash
webutil wiki ancient egypt
```

"outdoor gear" in Burlington, Vermont with the store locator URLs aliased by "stores-all."

```bash
webutil stores-all outdoor gear %% burlington, vt
```

directions from Phoenix, Arizona to Seattle, Washington with the maps URL aliased by "directions" and open in GUI browser 3.

```bash
webutil -3 directions phoenix, az %% seattle, wa
```

### 2. Multiple aliases

Search "home goods" with three different online store URLs aliased by "amazon," "ebay" and "jet."

```bash
webutil -a amazon ebay jet home goods
```

---

*Note: These aliases are predefined in **url-aliases** and can be used right away. They will be opened in the respective browser defined in **webutil** (the default is GUI browser 1).*

### 3. Search query

Search "How to make tamales" with the default search URL.

```bash
webutil How to make tamales
```

### 4. Direct URLs

Open two URLs directly.

```bash
webutil "blogspot.com" "http://www.scholarpedia.org/article/Swarm_robotics"
```

## Features

* Use up to 9 GUI and 7 terminal browsers/brower commands.
* Dump each URL's output to a terminal window.
* Specify a configuration option *(e.g. open in GUI browser 3)* per alias or URL (see *url-aliases* for more information).
* Output the parsed URLs to the clipboard.

## Installation

To install, please download ***install-webutil.sh*** with the following command and run it:

```bash
wget https://raw.githubusercontent.com/linux-shell-base/packaged-utilities/install/install-webutil.sh && \
chmod +x install-webutil.sh
```

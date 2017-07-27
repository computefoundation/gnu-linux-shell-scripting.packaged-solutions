
# Webutil

Open one or more URLs by alias, search query or directly in a web browser.

This utility supports all web browsers with a command line interface.

Four argument methods are allowed:

#### Aliases

1. An alias (first argument) with one or more optional search queries (remaining arguments).

2. Multiple aliases (first N arguments) with one or more optional search queries (remaining arguments after the last found alias). *(Requires switch `-a`).*

#### Other

3. A search query for use with the default search URL *(defined in webutil)*. *(Applies when the first argument does not match an alias [configurable] or with switch `-s`).*

4. URLs to be opened directly. *(Applies when one or more arguments begin with "http[s]://", "ftp://" or "file://" or end with the top level domain ".com", ".org", ".edu", ".gov", ".uk" or ".net" [can be adjusted]).*

Configurations are defined in [webutil](webutil) and aliases and URLs are defined in [url-aliases](url-aliases).

## Examples

### 1. Alias

Search ...

for information on ancient egypt with the URL for wikipedia *(aliased by "wiki").*

```bash
webutil wiki ancient egypt
```

directions from Phoenix, AZ to Seattle, WA with the maps URL *(aliased by "dir").*

```bash
webutil dir phoenix, az %% seattle, wa
```

abbreviations for the word *exponent* with the abbreviations search URL *(aliased by "abbr")* and open in GUI browser 3.

```bash
webutil -3 abbr exponent
```

for outdoor gear stores in Burlington, VT with the (multiple) store search URLs *(aliased by "stores-all")*.

```bash
webutil stores-all outdoor gear %% burlington, vt
```

### 2. Multiple aliases

Search for home goods with the URLs for Amazon, Ebay and Jet *(respectively aliased by "amazon," "ebay" and "jet").*

```bash
webutil -a amazon ebay jet home goods
```

---

*Note: These aliases are predefined in **url-aliases** and can be used right away. They will be opened in the respective browser defined in **webutil** (the default is GUI browser 1).*

### 3. Search query

Search "how to make tamales" with the default search URL.

```bash
webutil how to make tamales
```

### 4. Direct URLs

Open two URLs directly.

```bash
webutil "blogspot.com" "http://www.scholarpedia.org/article/Swarm_robotics"
```

## Features

* Use up to 9 GUI and 7 terminal browsers/brower commands.
* Specify a configuration option *(e.g. open in GUI browser 3)* per alias or URL (see *url-aliases* for more information).
* Dump each URL's output to a terminal window.
* Output the parsed URLs to the clipboard.

## Installation

To install, please download *install-webutil.sh* with the following command and run it:

```bash
wget https://raw.githubusercontent.com/linux-shell-base/packaged-utilities/install/install-webutil.sh \
&& chmod +x install-webutil.sh
```

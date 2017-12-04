
# Webutil

Open one or more URLs by alias or search query or directly in a web browser.

Webutil allows four argument methods:

1. **An alias** *(first argument)* with one or more optional search queries *(remaining arguments)*.

2. **Multiple aliases** *(first N arguments)* with one or more optional search queries *(all arguments after the last matching alias). Requires switch `-a`.*

3. **A search query** when the first argument does not match any alias *(configurable)*. *The URL used is defined in section Configurations of [webutil](webutil).*

4. **URLs** to be opened directly when one or more arguments begin with "http[s]://", "ftp://" or "file://" or end with the top level domain ".com", ".org", ".edu", ".gov", ".uk" or ".net" *(configurable)*.

Aliases and URLs are defined in [url-aliases](url-aliases) and configurations are defined in [webutil](webutil).

## Examples

### 1. Alias

Search ...

for information on ancient egypt with alias "wiki" (aliasing the URL for Wikipedia).

```bash
webutil wiki ancient egypt
```

directions from Phoenix, AZ to Seattle, WA with alias "dir" (aliasing a maps URL).

```bash
webutil dir phoenix, az %% seattle, wa
```

abbreviations for the word *exponent* with alias "abbr" (aliasing an abbreviations search URL) and open in GUI browser 3.

```bash
webutil -3 abbr exponent
```

for outdoor gear stores in Burlington, VT with alias "stores-all" (aliasing multiple store search URLs).

```bash
webutil stores-all outdoor gear %% burlington, vt
```

### 2. Multiple aliases

Search for home goods with aliases "amazon," "ebay" and "jet" (respectively aliasing the URLs for Amazon, eBay and Jet).

```bash
webutil -a amazon ebay jet home goods
```

*Note: These aliases are predefined in [url-aliases](url-aliases) and can be used right away. Please note that the respective browser defined in section Configurations of [webutil](webutil) must be installed.*

### 3. Search query

Search "how to make quinoa tabbouleh" with the default search URL.

```bash
webutil how to make quinoa tabbouleh
```

### 4. URLs

Open two URLs directly.

```bash
webutil "blogspot.com" "http://www.scholarpedia.org/article/Swarm_robotics"
```

## Features

* Use up to 9 GUI and 7 terminal browsers/brower commands.
* Specify a configuration option (e.g. open in GUI browser 3) per alias or URL (see [url-aliases](url-aliases) for more information).
* Dump each URL's output to a terminal window.
* Output the parsed URLs to the clipboard.

## Download

Please retrieve *download-webutil.sh* with the following command and run it to download:

```bash
url='https://raw.githubusercontent.com/unixfoundation/shell--packaged-utilities/download_scripts'\
'/download-webutil.sh' && wget "${url}" && chmod +x download-webutil.sh
```

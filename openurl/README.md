
# Openurl

Open one or more URLs in a web browser by alias or directly.

Openurl allows four types of arguments:

1. **An alias** (first argument) with one or more optional search queries (remaining arguments).

2. **Multiple aliases** (first N arguments) with one or more optional search queries (all arguments after the last matching alias). *Requires switch `-a`.*

3. **A search query** (when the first argument does not match any alias [configurable]). *The default search URL is defined in section Configurations of [openurl](openurl).*

4. **URLs** (when one or more arguments begin with http[s]://, ftp://, file:// or www. or end with the top level domain .com, .org, .edu, .gov, .uk or .net [configurable]).

Aliases are defined in [aliases](aliases) and configurations are defined in [openurl](openurl).

## Examples

### 1. Alias

Search ...

for information on ancient egypt with alias "wiki" (aliasing the URL for wikipedia).

```bash
openurl wiki ancient egypt
```

directions from Phoenix, AZ to Seattle, WA with alias "dir" (aliasing a maps URL).

```bash
openurl dir phoenix, az %% seattle, wa
```

for outdoor gear stores in Burlington, VT with alias "stores-all" (aliasing multiple store search URLs) and open in GUI browser 3.

```bash
openurl -3 stores-all outdoor gear %% burlington, vt
```

### 2. Multiple aliases

Search "home goods" with aliases "amazon," "ebay" and "jet" (aliasing the URLs for Amazon, eBay and Jet, respectively).

```bash
openurl -a amazon ebay jet home goods
```

*Note: These aliases are predefined in [aliases](aliases) and can be used right away. Please note that the respective browser defined in section Configurations of [openurl](openurl) must be installed.*

### 3. Search query

Search "how to make quinoa tabbouleh" with the default search URL.

```bash
openurl how to make quinoa tabbouleh
```

### 4. URLs

Open two URLs directly.

```bash
openurl "blogspot.com" "http://www.scholarpedia.org/article/Swarm_robotics"
```

## Features

* Use up to 9 GUI and 7 terminal browser commands.
* Specify a configuration option (e.g. open in GUI browser 3) per alias or URL (see [aliases](aliases) for more information).
* Dump each URL's output to a terminal window.
* Output the parsed URLs to the clipboard.

## Download

Please retrieve *download-openurl.sh* with the following command and run it to download:

```bash
curl -O 'https://raw.githubusercontent.com/unixfoundation/shell--packaged-utilities/'\
'download_scripts/download-openurl.sh' && chmod +x download-openurl.sh
```

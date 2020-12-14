
# Openurl

Openurl allows you to open one or more URLs from the terminal using one of the following argument types:

1. **An alias**

First argument with one or more optional search queries (remaining arguments).

2. **Multiple aliases**

First N arguments with one or more optional search queries (all arguments after the last matching alias). *Requires switch `-m`.*

3. **A search query**

(When the first argument does not match any alias). *This will open the deafult search URL defined in section Configurations of [openurl](openurl).*

4. **Direct URLs**

(When one or more arguments begin with URL schema *http*, *https*, *ftp* or *file* or subdomain *www* or contain a top-level domain suffix). *The top-level domain suffixes are defined in section Configurations of [openurl](openurl).*

You can define aliases and alias configuration options in [aliases](aliases). To confgure Openurl (e.g. change browser types), see the configurations section in [openurl](openurl).

## Examples

### 1. An alias

Open the URL for Wikipedia with alias "wiki."

```bash
openurl wiki
```

Open the URL for Wikipedia with alias "wiki" using "ancient egypt" as its search argument.

```bash
openurl wiki ancient egypt
```

Open a thesaurus search URL with alias "thes" using "original" as its search argument.

```bash
openurl thes original
```

Open business/store search URLs with alias "buss" using "outdoor gear" as their first and "burlington, vt" as their second search argument. (Additionally, open the URLs in GUI browser #3.)

```bash
openurl --g3 buss outdoor gear %% burlington, vt
```

### 2. Multiple aliases

Open the URLs for Amazon, eBay and Jet with aliases "amzn," "ebay" and "jet" using "home goods" as their search argument.

```bash
openurl -m amzn ebay jet home goods
```

### 3. A search query

Open the default search URL using "how to make quinoa tabbouleh" as its search argument.

```bash
openurl how to make quinoa tabbouleh
```

### 4. Direct URLs

Open two URLs directly.

```bash
openurl "blogspot.com" "http://www.scholarpedia.org/article/Swarm_robotics"
```

## Features

* Use up to 9 GUI and 7 terminal browsers.
* Specify a browser for each alias or URL.
* Dump output to terminal window.
* Output URLs to the clipboard.

*To get all configuration options, run `openurl --help`.*

## Download

Run the following command to download Openurl. *Note: This will create directory "computingfoundation/gnu-linux-shell-scripting.packaged-solutions/openurl" in your home directory*:

```bash
bash <(curl -s 'https://raw.githubusercontent.com/computingfoundation/'\
'gnu-linux-shell-usage.packaged-solutions/helper_scripts/cf-glsu.ps-download-openurl.sh')
```


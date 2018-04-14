
# Openurl

Open one or more URLs from the terminal (1) using an alias or (2) search query or (3) directly.

Openurl defines four argument schemas:

1. **An alias** (first argument) with one or more optional search queries (remaining arguments).

2. **Multiple aliases** (first N arguments) with one or more optional search queries (all arguments after the last matching alias). *Requires switch `-m`.*

3. **A search query** (when the first argument does not match any alias). *The default search URL is defined in section Configurations of [openurl](openurl).*

4. **URLs** (when one or more arguments begin with URL schema *http*, *https*, *ftp* or *file* or subdomain *www* or contain a top-level domain suffix). *The top-level domain suffixes used to match URLs are defined in section Configurations of [openurl](openurl).*

Aliases are defined in [aliases](aliases) and configurations are defined in [openurl](openurl).

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

### 4. URLs

Open two URLs directly.

```bash
openurl "blogspot.com" "http://www.scholarpedia.org/article/Swarm_robotics"
```

## Features

* Use up to 9 GUI and 7 terminal browser commands.
* Specify a configuration option (e.g. open in GUI browser 3) per alias or aliased URL (see [aliases](aliases) for more information).
* Dump the output of each URL to a terminal window.
* Output the URLs to the clipboard.

## Download

Run the following command to download Openurl:

```bash
bash <(curl -s 'https://raw.githubusercontent.com/computingfoundation/'\
'gnu-linux-shell-usage.packaged-solutions/helper_scripts/cf-glsu.ps-download-openurl.sh')
```


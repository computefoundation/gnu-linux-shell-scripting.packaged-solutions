
# Openurl

Open URLs using one of the following three argument types:

**1. Aliases**

Use an alias to open a URL and optionally pass search arguments.

**2. Default search URL**

Use a search parameter directly. *(The default search URL can be configured in [openurl](openurl).)*

**3. URLs directly**

Open one or more URLs directly.

*URLs are matched when they contain one of the following prefixes: http, https, ftp or file or by subdomain www or when they contain one of the top-level domain suffixes defined in [openurl](openurl).*

## Files to configure

Please define your aliases in [aliases](aliases) and your confgurations (e.g. GUI browsers to use) in [openurl](openurl).

## Examples

**1. Aliases**

Use "wiki" to open the URL for Wikipedia:

```bash
openurl wiki
```

Use "wiki" to open the URL for Wikipedia with search parameters "ancient egypt":

```bash
openurl wiki ancient egypt
```

Use "buss" to open all business/store URLs and use "outdoor gear" and "burlington, vt" as their two search parameters:

```bash
openurl buss outdoor gear %% burlington, vt
```

Use "amzn," "ebay" and "jet" to open the Amazon, eBay and Jet URLs using "home goods" as their search parameter:

```bash
openurl -m amzn ebay jet home goods
```

**2. Default search URL**

Search "how to code in C++" using the default search URL:

```bash
openurl how to code in C++
```

**3. URLs directly**

Open two URLs directly:

```bash
openurl "blogspot.com" "http://www.scholarpedia.org/article/Swarm_robotics"
```

## Features

* Add up to 9 GUI and 7 terminal browsers in [openurl](openurl)
* Specify a specific browser for each alias or URL
* Dump the output of any opened webpage to a terminal window
* Output all generated URLs to the clipboard

## Download

Run the following command to download Openurl (this will download the application to "\<your-home-directory>/computingfoundation/gnu-linux-shell-scripting.packaged-solutions/openurl"):

```bash
bash <(curl -s 'https://raw.githubusercontent.com/computefoundation/'\
'gnu-linux-shell-usage.packaged-solutions/helper_scripts/cf-glsu.ps-download-openurl.sh')
```


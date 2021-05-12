
# Openurl

Openurl allows you to open one or more URLs from the terminal using one of the following argument types:

1. **Aliases**

Pass the alias as the first argument. Openurl will try to find a match from [aliases](aliases). The remainig arguments can be used as search queries. To use multiple aliases, use option `-m`.

2. **A search query**

Pass a search query to [openurl](openurl) assuming the first argument does not match an alias. *The deafult search URL can be configured in [openurl](openurl).*

3. **URLs directly**

Pass one or more URLs directly to openurl. *(Please note: All non-URL arugments will be discarded.)*

URLs are matched by prefixes *http*, *https*, *ftp* or *file* or subdomain *www* or containing one of top-level domain suffixes configured in [openurl](openurl).

## Important files

The two important files to configure are [aliases](aliases) and [openurl](openurl). Define aliases in [aliases](aliases) and confgurations (e.g. browsers) in [openurl](openurl).

## Examples

### 1. Aliases

Open the URL for Wikipedia via alias "wiki."

```bash
openurl wiki
```

Open the URL for Wikipedia via alias "wiki" and search for "ancient egypt".

```bash
openurl wiki ancient egypt
```

Open a thesaurus search URL via alias "thes" and search for "original".

```bash
openurl thes original
```

Open business/store search URLs via alias "buss" and use "outdoor gear" as their first and "burlington, vt" as their second search argument. (And open the URLs in GUI browser #3.)

```bash
openurl --g3 buss outdoor gear %% burlington, vt
```

**Multiple aliases**

Open the URLs for Amazon, eBay and Jet via aliases "amzn," "ebay" and "jet" using "home goods" as their search argument.

```bash
openurl -m amzn ebay jet home goods
```

### 2. A search query

Search "how to make quinoa tabbouleh" using the default search URL.

```bash
openurl how to make quinoa tabbouleh
```

### 3. URLs directly

Open two URLs directly.

```bash
openurl "blogspot.com" "http://www.scholarpedia.org/article/Swarm_robotics"
```

## Features

* Use up to 9 GUI and 7 terminal browsers (configured in [openurl](openurl)).
* Specify a browser for each alias or URL.
* Dump the output of a page to terminal window.
* Output URLs to the clipboard.

*Run `openurl --help` to see all configurations and options.*

## Download

Run the following command to download Openurl. *Note: This will create directory "computingfoundation/gnu-linux-shell-scripting.packaged-solutions/openurl" in your home directory*:

```bash
bash <(curl -s 'https://raw.githubusercontent.com/computefoundation/'\
'gnu-linux-shell-usage.packaged-solutions/helper_scripts/cf-glsu.ps-download-openurl.sh')
```


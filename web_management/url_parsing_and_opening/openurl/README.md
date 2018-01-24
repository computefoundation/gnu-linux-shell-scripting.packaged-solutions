
# Openurl

Open one or more URLs from the terminal directly or using an alias or search query.

Openurl defines four argument schemas:

1. **An alias** (first argument) with one or more optional search queries (remaining arguments).

2. **Multiple aliases** (first N arguments) with one or more optional search queries (all arguments after the last matching alias). *Requires switch `-m`.*

3. **A search query** (when the first argument does not match any alias). *The default search URL is defined in section Configurations of [openurl](openurl).*

4. **URLs** (when one or more arguments begin with prefix *http[s]://*, *ftp://*, *file://* or *www.* or end with suffix *.com*, *.org*, *.edu*, *.gov*, *.uk* or *.net*).

Aliases are defined in [aliases](aliases) and configurations are defined in [openurl](openurl).

## Examples

### 1. Alias

Search...

...for information on ancient egypt with alias "wiki" (aliases the Wikipedia search URL).

```bash
openurl wiki ancient egypt
```

...directions from Phoenix, AZ to Seattle, WA with alias "dir" (aliases a maps directions search URL).

```bash
openurl dir phoenix, az %% seattle, wa
```

...for outdoor gear stores in Burlington, VT with alias "businesses" (aliases businesses search URLs) and open in GUI browser 3.

```bash
openurl -g3 businesses outdoor gear %% burlington, vt
```

### 2. Multiple aliases

Search "home goods" with aliases "amazon," "ebay" and "jet" (respectively alias the Amazon, eBay and Jet search URLs).

```bash
openurl -m amazon ebay jet home goods
```

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
* Dump the output of each URL to a terminal window.
* Output the URLs to the clipboard.

## Download

Run the following command to download:

```bash
bash <(curl -s 'https://raw.githubusercontent.com/computingfoundation/'\
'general-purpose-computing.packaged-solutions/helper_scripts/cf-gpc.ps-download-openurl.sh')
```


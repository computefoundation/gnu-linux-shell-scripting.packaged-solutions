#!/usr/bin/env bash
# 
# Download script for the utility Openurl in shell--packaged-utilities
# 

# ======= CONFIGURATIONS ==============

# Directory where files will be downloaded
readonly DOWNLOAD_DIR="${HOME}"

# ======= ! CONFIGURATIONS ==============

readonly MASTER_URL='https://raw.githubusercontent.com/unixfoundation/shell--packaged-utilities/master'
readonly BASE_URL="${MASTER_URL}/openurl"

readonly BASE_DIR="${DOWNLOAD_DIR}/shell--packaged-utilities/openurl"

if [ ! -d "${DOWNLOAD_DIR}/shell--packaged-utilities" ]; then
  mkdir -p "${DOWNLOAD_DIR}/shell--packaged-utilities"
fi

echo -e "::Downloading files to ${BASE_DIR}\n  Please wait"

[ -d "${BASE_DIR}" ] && rm -Rf "${BASE_DIR}"
mkdir "${BASE_DIR}"
cd "${BASE_DIR}"

exec 3>&1 4>&2; exec >/dev/null 2>&1 # redirect all output to /dev/null

# ============================================
#   Download files from openurl/
# ============================================

curl -O "${BASE_URL}/{aliases,aliases-file-parser.pl,openurl,"\
'search-placeholder-url-parser.pl}'
chmod +x aliases-file-parser.pl openurl search-placeholder-url-parser.pl


exec >&3 2>&4 # redirect all output back to /dev/tty
echo '::Finished'


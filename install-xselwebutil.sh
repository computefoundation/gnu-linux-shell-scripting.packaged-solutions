#!/usr/bin/env bash
# 
# Install script for Xselwebutil packaged utility from packaged-utilities.
# 

# ======= CONFIGURATIONS ==============

# Directory where files will be downloaded.
readonly DOWNLOAD_DIR="${HOME}"

# ======= ! CONFIGURATIONS ==============

readonly MASTER_URL='https://raw.githubusercontent.com/linux-shell-base/packaged-utilities/master'
readonly BASE_URL="${MASTER_URL}/xselwebutil"
readonly BASE_DIR="${DOWNLOAD_DIR}/packaged-utilities/xselwebutil"

echo -e "::Downloading files to ${BASE_DIR}\n  Please wait"

if [ ! -d "${DOWNLOAD_DIR}/packaged-utilities" ]; then
  mkdir -p "${DOWNLOAD_DIR}/packaged-utilities"
fi

[ -d "${BASE_DIR}" ] && rm -Rf "${BASE_DIR}"
mkdir "${BASE_DIR}"
cd "${BASE_DIR}"

exec 3>&1 4>&2; exec >/dev/null 2>&1 # redirect all output to /dev/null

# ============================================
#   Download files from xselwebutil/
# ============================================

wget "${BASE_URL}/xselwebutil"
chmod +x xselwebutil

# ============================================
#   Download files from _global/
# ============================================

wget "${MASTER_URL}/_global/url-search-placeholder-parser.pl"
chmod +x url-search-placeholder-parser.pl


exec >&3 2>&4 # redirect all output back to /dev/tty
echo '::Finished'


#!/usr/bin/env bash
# 
# File:
#   download-openurl.sh
# 
# Description:
#   Download utility Openurl from unixfoundation/general-purpose-computing.packaged-utilities.
# 

readonly SOLUTION_PATH='web_management/url_parsing_and_opening/openurl'
readonly URL='https://raw.githubusercontent.com/unixfoundation'\
"/general-purpose-computing.packaged-solutions/master/${SOLUTION_PATH}"

# ======= CONFIGURATIONS ==============

# Root directory where files will be downloaded
readonly DOWNLOAD_ROOT_DIR="${HOME}"

# ======= ! CONFIGURATIONS ==============

readonly DOWNLOAD_DIR="${DOWNLOAD_ROOT_DIR}/unixfoundation"\
"/general-purpose-computing.packaged-utilities/${SOLUTION_PATH}"

if [ ! -d "${DOWNLOAD_DIR}" ]; then
  mkdir -p "${DOWNLOAD_DIR}"
fi
cd "${DOWNLOAD_DIR}"

echo -e "::Downloading files to ${DOWNLOAD_ROOT_DIR}/unixfoundation\
/general-purpose-computing.packaged-utilities\n  Please wait"

exec 3>&1 4>&2; exec >/dev/null 2>&1 # redirect all output to /dev/null

# ============================================
#   Download the files
# ============================================

curl -O "${URL}/{aliases,aliases-file-parser.pl,openurl,"\
'search-placeholder-url-parser.pl}'
chmod +x 'aliases-file-parser.pl' 'openurl' 'search-placeholder-url-parser.pl'


exec >&3 2>&4 # redirect all output back to /dev/tty
echo '::Finished'


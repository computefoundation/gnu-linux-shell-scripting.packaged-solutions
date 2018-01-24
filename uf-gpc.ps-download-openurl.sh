#!/usr/bin/env bash
# 
# File:
#   uf-gpc.ps-download-openurl.sh
# 
# Description:
#   Download utility Openurl from
#   unixfoundation/general-purpose-computing.packaged-utilities.
# 

readonly SOLUTION_PATH='web_management/url_parsing_and_opening/openurl'
readonly SOLUTION_URL='https://raw.githubusercontent.com/unixfoundation'\
"/general-purpose-computing.packaged-solutions/master/${SOLUTION_PATH}"

# ======= CONFIGURATIONS ==============

# Root directory where files will be downloaded
readonly DOWNLOAD_ROOT_DIRECTORY="${HOME}"

# ======= ! CONFIGURATIONS ==============

# ============================================
#   Prepare the download directory
# ============================================

readonly DOWNLOAD_DIRECTORY="${DOWNLOAD_ROOT_DIRECTORY}/unixfoundation"\
"/general-purpose-computing.packaged-utilities/${SOLUTION_PATH}"

if [ ! -d "${DOWNLOAD_DIRECTORY}" ]; then
  mkdir -p "${DOWNLOAD_DIRECTORY}"
fi

# ============================================
#   Download the files
# ============================================

cd "${DOWNLOAD_DIRECTORY}"

echo -e "::Downloading files to ${DOWNLOAD_ROOT_DIRECTORY}/unixfoundation\
/general-purpose-computing.packaged-utilities\n  Please wait"
exec 3>&1 4>&2; exec >/dev/null 2>&1 # redirect all output to /dev/null

curl -O "${SOLUTION_URL}/{aliases,aliases-file-parser.pl,openurl,"\
'search-placeholder-url-parser.pl}'
chmod +x 'aliases-file-parser.pl' 'openurl' 'search-placeholder-url-parser.pl'


exec >&3 2>&4 # redirect all output back to /dev/tty
echo '::Finished'


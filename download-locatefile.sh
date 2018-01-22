#!/usr/bin/env bash
# 
# File:
#   download-locatefile.sh
# 
# Description:
#   Download utility Locatefile in unixfoundation/shell.packaged-utilities.
# 

readonly URL='https://raw.githubusercontent.com/unixfoundation/shell.packaged-utilities/master/locatefile'

# ======= CONFIGURATIONS ==============

# Root directory where files will be downloaded
readonly DOWNLOAD_ROOT_DIR="${HOME}"

# ======= ! CONFIGURATIONS ==============

readonly DOWNLOAD_DIR="${DOWNLOAD_ROOT_DIR}/unixfoundation/shell.packaged-utilities/locatefile"

if [ ! -d "${DOWNLOAD_DIR}" ]; then
  mkdir -p "${DOWNLOAD_DIR}"
fi
cd "${DOWNLOAD_DIR}"

echo -e "::Downloading files to ${DOWNLOAD_DIR}\n  Please wait"

exec 3>&1 4>&2; exec >/dev/null 2>&1 # redirect all output to /dev/null

# ============================================
#   Download the files
# ============================================

curl -O "${URL}/{CONFIGURATIONS.bash,locatefile,updatedb}"
chmod +x 'locatefile' 'updatedb'

path='/dirsdb'
mkdir "${DOWNLOAD_DIR}${path}"
cd "${DOWNLOAD_DIR}${path}"
curl -O "${URL}${path}/{mount-drive-1-paths,mount-drive-2-paths,"\
'home-paths}'

path='/filesdb'
mkdir "${DOWNLOAD_DIR}${path}"
cd "${DOWNLOAD_DIR}${path}"
curl -O "${URL}${path}/{mount-drive-1-paths,mount-drive-2-paths,"\
'home-paths}'


exec >&3 2>&4 # redirect all output back to /dev/tty
echo '::Finished'


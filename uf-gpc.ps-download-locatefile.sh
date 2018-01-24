#!/usr/bin/env bash
# 
# File:
#   uf-gpc.ps-download-locatefile.sh
# 
# Description:
#   Download utility Locatefile from
#   unixfoundation/general-purpose-computing.packaged-utilities.
# 

readonly SOLUTION_PATH='file_management/file_locating/locatefile'
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

curl -O "${SOLUTION_URL}/{CONFIGURATIONS.bash,locatefile,updatedb}"
chmod +x 'locatefile' 'updatedb'

currPath='/dirsdb'
mkdir "${DOWNLOAD_DIRECTORY}${currPath}"
cd "${DOWNLOAD_DIRECTORY}${currPath}"
curl -O "${SOLUTION_URL}${currPath}/{mount-drive-1-paths,mount-drive-2-paths,"\
'home-paths}'

currPath='/filesdb'
mkdir "${DOWNLOAD_DIRECTORY}${currPath}"
cd "${DOWNLOAD_DIRECTORY}${currPath}"
curl -O "${SOLUTION_URL}${currPath}/{mount-drive-1-paths,mount-drive-2-paths,"\
'home-paths}'


exec >&3 2>&4 # redirect all output back to /dev/tty
echo '::Finished'


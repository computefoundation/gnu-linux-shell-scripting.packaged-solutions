#!/usr/bin/env bash
# 
# File:
#   cf-gpc.ps-download-locatefile.sh
# 
# Description:
#   Download utility Locatefile from
#   computingfoundation/gnu-linux-shell-use.packaged-solutions.
# 

readonly SOLUTION_PATH='file_management/file_retrieval/locatefile'
readonly SOLUTION_URL='https://raw.githubusercontent.com/computingfoundation'\
"/gnu-linux-shell-use.packaged-solutions/master/${SOLUTION_PATH}"

# ======= CONFIGURATIONS ==============

# Root directory where files will be downloaded
readonly DOWNLOAD_ROOT_DIRECTORY="${HOME}"

# ======= ! CONFIGURATIONS ==============

# ============================================
#   Prepare the download directory
# ============================================

readonly DOWNLOAD_DIRECTORY="${DOWNLOAD_ROOT_DIRECTORY}/computingfoundation"\
"/gnu-linux-shell-use.packaged-solutions/${SOLUTION_PATH}"

if [ ! -d "${DOWNLOAD_DIRECTORY}" ]; then
  mkdir -p "${DOWNLOAD_DIRECTORY}"
fi

# ============================================
#   Download the files
# ============================================

cd "${DOWNLOAD_DIRECTORY}"

echo -e "::Downloading files to ${DOWNLOAD_ROOT_DIRECTORY}/computingfoundation\
/gnu-linux-shell-use.packaged-solutions\n  Please wait"
exec 3>&1 4>&2; exec >/dev/null 2>&1 # redirect all output to /dev/null

curl -O "${SOLUTION_URL}/{configurations,dbfilepaths,locatefile,updatedb}"
chmod +x 'locatefile' 'updatedb'

currPath='/directory_paths_database'

mkdir "${DOWNLOAD_DIRECTORY}${currPath}"
cd "${DOWNLOAD_DIRECTORY}${currPath}"
curl -O "${SOLUTION_URL}${currPath}/{mount-drive-1-paths,mount-drive-2-paths,"\
'home-paths}'

currPath='/file_paths_database'

mkdir "${DOWNLOAD_DIRECTORY}${currPath}"
cd "${DOWNLOAD_DIRECTORY}${currPath}"
curl -O "${SOLUTION_URL}${currPath}/{mount-drive-1-paths,mount-drive-2-paths,"\
'home-paths}'


exec >&3 2>&4 # redirect all output back to /dev/tty
echo '::Finished'


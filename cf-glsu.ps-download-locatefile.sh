#!/usr/bin/env bash
# 
# File:
#   cf-gpc.ps-download-locatefile.sh
# 
# Description:
#   Download utility Locatefile from
#   computingfoundation/gnu-linux-shell-scripting.packaged-solutions.
# 

readonly SOLUTION_NAME='locatefile'
readonly SOLUTION_PATH="file_management/file_retrieval/${SOLUTION_NAME}"
readonly SOLUTION_URL='https://raw.githubusercontent.com/computingfoundation'\
"/gnu-linux-shell-scripting.packaged-solutions/master/${SOLUTION_PATH}"

# ======= CONFIGURATIONS ==============

# Root directory where files will be downloaded
readonly DOWNLOAD_ROOT_DIRECTORY="${HOME}"

# ======= ! CONFIGURATIONS ==============

# ============================================
#   Prepare the download directory
# ============================================

readonly DOWNLOAD_DIRECTORY="${DOWNLOAD_ROOT_DIRECTORY}/computingfoundation"\
"/gnu-linux-shell-scripting.packaged-solutions/${SOLUTION_NAME}"

if [ ! -d "${DOWNLOAD_DIRECTORY}" ]; then
  mkdir -p "${DOWNLOAD_DIRECTORY}"
fi

# ============================================
#   Download the files
# ============================================

cd "${DOWNLOAD_DIRECTORY}"

echo -e "::Downloading files to \"${DOWNLOAD_DIRECTORY}\"..."
exec 3>&1 4>&2; exec >/dev/null 2>&1 # redirect all output to /dev/null

curl -O "${SOLUTION_URL}/{CONFIGURATIONS,FILEPATHS,locatefile,updatedb}"
chmod +x 'locatefile' 'updatedb'

currPath='database'

mkdir "${DOWNLOAD_DIRECTORY}/${currPath}"

mkdir "${DOWNLOAD_DIRECTORY}/${currPath}/file_paths"
cd "${DOWNLOAD_DIRECTORY}/${currPath}/file_paths"
curl -O "${SOLUTION_URL}/${currPath}/file_paths/{mount-drive-1-paths,"\
'mount-drive-2-paths,home-paths}'

mkdir "${DOWNLOAD_DIRECTORY}/${currPath}/directory_paths"
cd "${DOWNLOAD_DIRECTORY}/${currPath}/directory_paths"
curl -O "${SOLUTION_URL}/${currPath}/directory_paths/{mount-drive-1-paths,"\
'mount-drive-2-paths,home-paths}'


exec >&3 2>&4 # redirect all output back to /dev/tty
echo '::Files downloaded'


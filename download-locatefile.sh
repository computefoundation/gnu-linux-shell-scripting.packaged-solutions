#!/usr/bin/env bash
# 
# Download script for utility Locatefile in shell--packaged-utilities
# 

# ======= CONFIGURATIONS ==============

# Directory where files will be downloaded
readonly DOWNLOAD_DIR="${HOME}"

# ======= ! CONFIGURATIONS ==============

readonly MASTER_URL='https://raw.githubusercontent.com/unixfoundation/shell--packaged-utilities/master'
readonly BASE_URL="${MASTER_URL}/locatefile"
readonly BASE_DIR="${DOWNLOAD_DIR}/shell--packaged-utilities/locatefile"

if [ ! -d "${DOWNLOAD_DIR}/shell--packaged-utilities" ]; then
  mkdir -p "${DOWNLOAD_DIR}/shell--packaged-utilities"
fi

echo -e "::Downloading files to ${BASE_DIR}\n  Please wait"

[ -d "${BASE_DIR}" ] && rm -Rf "${BASE_DIR}"
mkdir "${BASE_DIR}"
cd "${BASE_DIR}"

exec 3>&1 4>&2; exec >/dev/null 2>&1 # redirect all output to /dev/null

# ============================================
#   Download files from locatefile/
# ============================================

wget -i - <<EOF
  ${BASE_URL}/CONFIGURATIONS.bash
  ${BASE_URL}/locatefile
  ${BASE_URL}/updatedb
EOF
chmod +x locatefile updatedb

path='/dirsdb'
mkdir "${BASE_DIR}${path}"
wget -P "${BASE_DIR}${path}" -i - <<EOF
  ${BASE_URL}${path}/mount-drive-1-paths
  ${BASE_URL}${path}/mount-drive-2-paths
  ${BASE_URL}${path}/home-paths
EOF

path='/filesdb'
mkdir "${BASE_DIR}${path}"
wget -P "${BASE_DIR}${path}" -i - <<EOF
  ${BASE_URL}${path}/mount-drive-1-paths
  ${BASE_URL}${path}/mount-drive-2-paths
  ${BASE_URL}${path}/home-paths
EOF


exec >&3 2>&4 # redirect all output back to /dev/tty
echo '::Finished'


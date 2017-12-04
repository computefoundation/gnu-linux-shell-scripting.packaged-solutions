#!/usr/bin/env bash
# 
# Download script for the Local packaged utility from
# shell--packaged-utilities
# 

# ======= CONFIGURATIONS ==============

# Directory where files will be downloaded.
readonly DOWNLOAD_DIR="${HOME}"

# ======= ! CONFIGURATIONS ==============

readonly MASTER_URL='https://raw.githubusercontent.com/unixfoundation/shell--packaged-utilities/master'
readonly BASE_URL="${MASTER_URL}/locate"
readonly BASE_DIR="${DOWNLOAD_DIR}/shell--packaged-utilities/locate"

if [ ! -d "${DOWNLOAD_DIR}/shell--packaged-utilities" ]; then
  mkdir -p "${DOWNLOAD_DIR}/shell--packaged-utilities"
fi

echo -e "::Downloading files to ${BASE_DIR}\n  Please wait"

[ -d "${BASE_DIR}" ] && rm -Rf "${BASE_DIR}"
mkdir "${BASE_DIR}"
cd "${BASE_DIR}"

exec 3>&1 4>&2; exec >/dev/null 2>&1 # redirect all output to /dev/null

# ============================================
#   Download files from locate/
# ============================================

wget -i - <<EOF
  ${BASE_URL}/CONFIGURATIONS.sh
  ${BASE_URL}/locate
  ${BASE_URL}/updatedb
EOF
chmod +x locate updatedb

path='/dirsdb'
mkdir "${BASE_DIR}${path}"
wget -P "${BASE_DIR}${path}" -i - <<EOF
  ${BASE_URL}${path}/container1
  ${BASE_URL}${path}/container2
  ${BASE_URL}${path}/home-data
EOF

path='/filesdb'
mkdir "${BASE_DIR}${path}"
wget -P "${BASE_DIR}${path}" -i - <<EOF
  ${BASE_URL}${path}/container1
  ${BASE_URL}${path}/container2
  ${BASE_URL}${path}/home-data
EOF


exec >&3 2>&4 # redirect all output back to /dev/tty
echo '::Finished'


#!/usr/bin/env bash
# 
# Constants for scripts in this directory.
# 
# Note:
#   Variable "HERE" is defined in the sourcing scripts (locate and updatedb).
# 

# Directory for file paths database files.
FILE_PATHS_DB_DIR="${HERE}/filesdb"

# Directory for directory paths database files.
DIR_PATHS_DB_DIR="${HERE}/dirsdb"

# File names to use in both database directories; they will be searched in
# order.
DB_FILE_NAMES=('container1' 'container2' 'home-data')

# Mountpoint paths: Paths of mounted drives containing files and directories to
# locate. When an output path (in updatedb) begins with any of these mountpoint
# paths, the mountpoint path of each created path will be replaced by
# "{MNTPNT_PATH}" in the database. When a file or directory is then located, the
# mountpoint paths defined here will be traversed through in place of the
# "{MNTPNT_PATH}" placeholder in each path containing one until the file or
# directory is found.
MNTPNT_PATHS=(
  '/mnt/usb1'
  '/mnt/usb2'
  '/mnt/usb3'
  '/mnt/usb4'
)


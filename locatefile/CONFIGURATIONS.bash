#!/usr/bin/env bash
# 
# Configurations for scripts in this directory
# 
# Note:
#   Variable HERE is defined in the sourcing scripts (locatefile and updatedb)
#   and contains the path to the current directory.
# 

# Directory for file paths database files
FILE_PATHS_DB_DIR="${HERE}/filesdb"

# Directory for directory paths database files
DIR_PATHS_DB_DIR="${HERE}/dirsdb"

# File names to use in both database directories; they will be searched in
# order
DB_FILE_NAMES=('mount-drive-1-paths' 'mount-drive-2-paths' 'home-paths')

# Paths of mounted drives to be used by locatefile
# When a databse file or directory path begins with "{MNTPNT_PATH}/", these
# paths will traversed through and replace "{MNTPNT_PATH}" until the file or
# directory is found. Database paths beginning with "{MNTPNT_PATH}/" are
# created by beginning a file or directory path in updatedb with one of these
# paths.
MNTPNT_PATHS=(
  '/mnt/usb1'
  '/mnt/usb2'
  '/mnt/usb3'
  '/mnt/usb4'
)


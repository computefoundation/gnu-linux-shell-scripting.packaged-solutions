#!/usr/bin/env bash
# 
# Constants for scripts in this directory.
# 

# Directory for file paths database files.
FILE_PATHS_DB_DIR="${HERE}/filesdb"

# Directory for directory paths database files.
DIR_PATHS_DB_DIR="${HERE}/dirsdb"

# File names to use in both database directories; they will be searched in order
# and are used for file/directory paths in updatedb.
DB_FILE_NAMES=('container1' 'container2' 'home-data')

# Mountpoint directories
# Directories containing locate paths in external drives. When an output path
# begins with any of these base paths, they are traversed through as the base
# path of the full path until the file or directory is found.
MNTPNT_DIRS=(
  '/mnt/usb1'
  '/mnt/usb2'
  '/mnt/usb3'
  '/mnt/usb4'
)

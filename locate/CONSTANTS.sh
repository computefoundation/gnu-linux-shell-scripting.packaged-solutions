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

# Mountpoint directories: Directories containing locate paths in external
# drives. When an output path in updatedb begins with any of these mountpoint
# paths, the mountpoint path will be replaced by "{MNTPNT_PATH}" in the
# database. When a file or directory is then located in the database and its
# path begins with "{MNTPNT_PATH}", these mountpoint paths are traversed through
# in its place until the file or directory is found.
MNTPNT_PATHS=(
  '/mnt/usb1'
  '/mnt/usb2'
  '/mnt/usb3'
  '/mnt/usb4'
)


# Locate

Locate a file or directory from a database.

This utility is created entirely with bash and grep, simple and fast.

## Databases

*Locate* uses two databases containing text files, one consisting of file paths and one consisting of directory paths.

These text files are populated with output paths defined in *updatedb*. *(Note: The predefined output paths in updatedb and the precreated databases **dirsdb** and **filesdb** are provided just as examples).*

*Locate* searches the file paths database by default and the the directory paths database with switch `-d` for a file/directory name and returns its path.

## Set up

Three things have to be done to use *Locate*:

1. Assign the preferred constant values in *CONSTANTS.sh*.
2. Define the preferred output paths in *updatedb*.
3. Run *updatedb*.

Once completed, the databases will be set up and *Locate* can be used as shown in the examples below.

## Examples *(based on the precreated databases)*

Locate a file.

```bash
locate addr
# returns /home/<user>/documents/addresses.txt
```

```bash
locate book
# returns /home/<user>/archived_data/backup/bookmarks.html
```

```bash
locate shr # note: any part of the file/directory name can be used; the first match will be returned
# returns /home/<user>/.bashrc
```

*(Locate a file in a mounted drive [assuming it is mounted]; see the MNTPNT_PATHS variable in CONSTANTS.sh for more information).*

```bash
locate stat
# returns {MNTPNT_PATH}/records/external/statistics.txt where {MNTPNT_PATH} is the mountpoint of the
# mounted drive
```

Locate a directory.

```bash
locate -d tur
# returns /home/<user>/pictures
```

## Notes

* This utility does not support file names with spaces.

## Installation

To install, please download *install-locate.sh* with the following command and run it:

```bash
wget https://raw.githubusercontent.com/linux-shell-base/packaged-utilities/install/install-locate.sh \
&& chmod +x install-locate.sh
```


# Locate

Locate a file or directory from a database.

This utility is created entirely in bash, simple and fast.

## Databases

There is a file paths database and a directory paths database.

These databases are populated with output paths defined in *updatedb*.

*(updatedb contains predefined output paths and the precreated databases **dirsdb** and **filesdb** are provided as examples).*

*locate* searches the file paths database by default and the directory paths database with switch `-d`.

## Set up

To use *locate*, three things have to be done:

1. Assign the preferred variable values in *CONSTANTS.sh*.
2. Define the preferred output paths in *updatedb*.
3. Run *updatedb*.

Once completed, *locate* can be used as shown in the examples below.

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

To install, please download ***install-locate.sh*** with the following command and run it:

```bash
wget https://raw.githubusercontent.com/linux-shell-base/packaged-utilities/install/install-locate.sh && \
chmod +x install-locate.sh
```

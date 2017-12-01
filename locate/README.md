
# Locate

Locate a file or directory from a database.

## Databases

*Locate* uses two databases, one for file paths and one for directory paths. They are populated with [updatedb](updatedb).

*Locate* searches the file paths database by default and the the directory paths database with switch `-d`.

*The precreated databases **dirsdb** and **filesdb** are provided just as examples.*

## Examples

The following examples are based on the precreated databases and can be tested.

### 1. Locate file

```bash
locate addr # returns /home/<user>/documents/addresses.txt
```

```bash
locate book # returns /home/<user>/archived_data/backup/bookmarks.html
```

*Locate a file using any part of the file name; the first match will be returned.*

```bash
locate shr # returns /home/<user>/.bashrc
```

*Locate a file in a mounted drive (see the MNTPNT_PATHS variable in [CONSTANTS.sh](CONSTANTS.sh) for more information).*

```bash
locate stat # returns {MNTPNT_PATH}/records/external/statistics.txt where "{MNTPNT_PATH}" is the
            # mountpoint of the mounted drive
```

### 2. Locate directory

```bash
locate -d tur # returns /home/<user>/pictures
```

## Set up

1. Assign the preferred constant values in [CONSTANTS.sh](CONSTANTS.sh).
2. Define the preferred output paths in [updatedb](updatedb).
3. Run [updatedb](updatedb).

## Notes

* This utility does not support file names with spaces.

## Installation

Please download *install-locate.sh* with the following command and run it to install:

```bash
wget https://raw.githubusercontent.com/linux-shell-base/packaged-utilities/install/install-locate.sh \
&& chmod +x install-locate.sh
```

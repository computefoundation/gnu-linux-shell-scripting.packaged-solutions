
# Locate

Locate a file or directory from a database.

## Databases

Locate uses two databases, one for file paths and one for directory paths. They are populated with [updatedb](updatedb).

Locate searches the file paths database by default and the the directory paths database with switch `-d`.

*Note: The precreated databases **filesdb** and **dirsdb** are provided just as examples. The following examples are based on them.*

## Examples

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

*Locate a file in a mounted drive (see the MNTPNT_PATHS variable in [CONFIGURATIONS.bash](CONFIGURATIONS.bash) for more information).*

```bash
locate stat # returns {MNTPNT_PATH}/records/external/statistics.txt where "{MNTPNT_PATH}" is the
            # mountpoint of the mounted drive
```

### 2. Locate directory

```bash
locate -d tur # returns /home/<user>/pictures
```

## Set up

1. Assign the preferred constant values in [CONFIGURATIONS.bash](CONFIGURATIONS.bash).
2. Define the preferred output paths in [updatedb](updatedb).
3. Run [updatedb](updatedb).

## Notes

* This utility does not support file names with spaces.

## Download

Please retrieve *download-locate.sh* with the following command and run it to download:

```bash
url='https://raw.githubusercontent.com/unix-foundation/shell--packaged-utilities/download'\
'/download-locate.sh' && wget "${url}" && chmod +x download-locate.sh
```


# Locatefile

Locate a file or directory from a database.

## Databases

Locatefile uses two databases consisting of file and directory paths, respectively.

It searches the file paths database by default and the directory paths database via switch `-d`.

*The directories **filesdb** and **dirsdb** are precreated example databases. The following examples are based on them.*

## Examples

### 1. Locate a file

```bash
locatefile addr # returns "/home/<user>/documents/addresses.txt"
```

```bash
locatefile book # returns "/home/<user>/archived_data/backup/bookmarks.html"
```

*Use any part of the file or directory name; the first match will be returned.*

```bash
locatefile shr # returns "/home/<user>/.bashrc"
```

*Locate a file or directory in a mounted drive (see the MNTPNT_PATHS variable in [CONFIGURATIONS.bash](CONFIGURATIONS.bash) for more information).*

```bash
locatefile stat # returns "MNTPNT_PATH/records/external/statistics.txt" (if the drive containing the
                # file is mounted), where "MNTPNT_PATH" is the mountpoint of the mounted drive
```

### 2. Locate a directory

```bash
locatefile -d tur # returns "/home/<user>/pictures"
```

## Set up

1. Adjust configurations as needed in [CONFIGURATIONS.bash](CONFIGURATIONS.bash).
2. Define the databases file/directory output paths in [updatedb](updatedb).
3. Run [updatedb](updatedb).

## Notes

This utility...

* accepts regular expressions for the file/directory name.
* does not support file names containing spaces.

## Download

Please retrieve *download-locatefile.sh* with the following command and run it to download:

```bash
curl -O 'https://raw.githubusercontent.com/unixfoundation/shell--packaged-utilities/'\
'download_scripts/download-locatefile.sh' && chmod +x download-locatefile.sh
```


# Locatefile

Locate a file or directory from a database.

## Databases

Locatefile uses a file paths database and a directory paths database. Both databases are populated with [updatedb](updatedb).

The file paths database is searched by default and the directory paths database is searched via switch `-d`.

*The precreated databases **filesdb** and **dirsdb** are example databases. The following examples are based on them and can be tested right away.*

## Examples

### 1. Locate file

```bash
locatefile addr # returns /home/<user>/documents/addresses.txt
```

```bash
locatefile book # returns /home/<user>/archived_data/backup/bookmarks.html
```

*Any part of the file or directory name can be used; the first match will be returned.*

```bash
locatefile shr # returns /home/<user>/.bashrc
```

*A file or directory in a mounted drive can be located (see the MNTPNT_PATHS variable in [CONFIGURATIONS.bash](CONFIGURATIONS.bash) for more information).*

```bash
locatefile stat # returns {MNTPNT_PATH}/records/external/statistics.txt, where "{MNTPNT_PATH}" is the
                # mountpoint of the mounted drive, if the drive containing the file is mounted
```

### 2. Locate directory

```bash
locatefile -d tur # returns /home/<user>/pictures
```

## Set up

1. Assign the preferred constant values in [CONFIGURATIONS.bash](CONFIGURATIONS.bash).
2. Define the preferred output paths in [updatedb](updatedb).
3. Run [updatedb](updatedb).

## Notes

* This utility does not support file names with spaces.

## Download

Please retrieve *download-locatefile.sh* with the following command and run it to download:

```bash
curl -O 'https://raw.githubusercontent.com/unixfoundation/shell--packaged-utilities/'\
'download_scripts/download-locatefile.sh' && chmod +x download-locatefile.sh
```

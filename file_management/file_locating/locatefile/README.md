
# Locatefile

Locate a file or directory from a file paths database.

## Databases

Locatefile uses two databases consisting of file and directory paths, respectively.

It searches the file paths database by default and the directory paths database via switch `-d`.

*The directories **filesdb** and **dirsdb** are precreated example databases. The following examples are based on them.*

## Examples

### 1. Locate a file

```bash
locatefile my-doc # returns "/home/user/documents/my-document.txt"
```

*Use any part of the file or directory name; the first match will be returned.*

```bash
locatefile shr # returns "/home/user/.bashrc"
```

*Locate a file or directory in a mounted drive (see the MNTPNT_PATHS variable in [CONFIGURATIONS.bash](CONFIGURATIONS.bash) for more information).*

```bash
locatefile stat # returns "MNTPNT_PATH/records/external/statistics.txt" (if the drive containing the
                # file is mounted), where "MNTPNT_PATH" is the mountpoint of the mounted drive
```

### 2. Locate a directory

```bash
locatefile -d tur # returns "/home/user/pictures"
```

## Set up

1. Adjust configurations as needed in [CONFIGURATIONS.bash](CONFIGURATIONS.bash).
2. Define the databases file/directory paths in [updatedb](updatedb).
3. Run [updatedb](updatedb).

## Notes

This utility...

* ...accepts regular expressions for the file/directory name.
* ...does not support file names with spaces.

## Download

Run the following command to download:

```bash
bash <(curl -s 'https://raw.githubusercontent.com/unixfoundation/'\
'general-purpose-computing.packaged-solutions/download_scripts/uf-gpc.ps-download-locatefile.sh')
```


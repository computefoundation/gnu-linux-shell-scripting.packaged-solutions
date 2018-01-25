
# Locatefile

Locate a file from a database.

## Databases

Locatefile uses two databases consisting of file and directory paths, respectively.

It searches the file paths database by default and the directory paths database via switch `-d`.

*The directories **file_paths_database** and **directory_paths_database** are precreated example databases. The following examples are based on them.*

## Examples

### 1. Locate a file

```bash
locatefile my-doc # returns "/home/user/documents/my-document.txt"
```

*Use any part of the file or directory name; the first match will be returned.*

```bash
locatefile shr # returns "/home/user/.bashrc"
```

*Locate a file or directory in a mounted drive (see the MOUNTPOINT_PATHS variable in [configurations](configurations) for more information).*

```bash
locatefile stat # returns "MNTPNT_PATH/records/external/statistics.txt" (if the drive containing the
                # file is mounted), where "MNTPNT_PATH" is the mountpoint of the mounted drive
```

### 2. Locate a directory

```bash
locatefile -d tur # returns "/home/user/pictures"
```

## Set up

1. Adjust configurations as needed in [configurations](configurations).
2. Define the databases file/directory paths in [filepaths](filepaths).
3. Run [updatedb](updatedb).

## Notes

Locatefile...

* ...accepts regular expressions for the file/directory name.
* ...does not support file names with spaces.

## Download

Run the following command to download:

```bash
bash <(curl -s 'https://raw.githubusercontent.com/computingfoundation/'\
'general-purpose-computing.packaged-solutions/helper_scripts/cf-gpc.ps-download-locatefile.sh')
```


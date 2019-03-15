
# Locatefile

Locate a file from a text-based database directory.

## Databases

Locatefile uses two databases consisting of text files: one for file and one for directory paths.

[locatefile](locatefile) searches the file paths database by default and the directory paths database via switch `-d`.

## Examples

*Note: The following examples are based on the precreated example databases [file_paths_database](file_paths_database) and [directory_paths_database](directory_paths_database).*

### 1. Locate a file

```bash
locatefile my-doc # returns "/home/user/documents/my-document.txt"
```

*Any part of the file name can be used; the first match will be returned*

```bash
locatefile shr # returns "/home/user/.bashrc"
```

*A file can be located in a mounted drive (see the MOUNTPOINT_PATHS variable in [configurations](configurations) for more information)*

```bash
locatefile stat # returns "MNTPNT_PATH/records/external/statistics.txt" (if the drive containing the
                # file is mounted), where "MNTPNT_PATH" is the mountpoint of the mounted drive
```

### 2. Locate a directory

```bash
locatefile -d tur # returns "/home/user/pictures"
```

## Usage

1. Adjust the configurations in [configurations](configurations).
2. Define the databases' file and directory paths in [dbfilepaths](dbfilepaths).
3. Run [updatedb](updatedb).

## Notes

[locatefile](locatefile)...

* ...accepts regular expressions.
* ...does not support file names with spaces.

## Download

Run the following command to download Locatefile:

```bash
bash <(curl -s 'https://raw.githubusercontent.com/computingfoundation/'\
'gnu-linux-shell-usage.packaged-solutions/helper_scripts/cf-glsu.ps-download-locatefile.sh')
```


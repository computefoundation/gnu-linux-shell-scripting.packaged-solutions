
# Locatefile

Locate a file from a text-based database directory.

## Databases

Locatefile uses two databases consisting of text files: one for file and one for directory paths.

[locatefile](locatefile) searches the file paths database by default and the directory paths database via switch `-d`.

## Examples

*Note: The following examples are based on the precreated example [database](database).*

### 1. Locate a file

```bash
locatefile my-doc # returns "/home/user/documents/my-document.txt"
```

Any part of a file name can be used to find a file; the first match will be returned.

```bash
locatefile roj # returns "/home/user/archives/backup/projects.txt"
```

A file can be located in a mounted drive (see the MOUNTPOINT_PATHS variable in [configurations](configurations) for more information).

```bash
locatefile my-note # returns "MNTPNT_PATH/general/notes/my-notes.txt" (if the drive containing the
                   # file is mounted), where "MNTPNT_PATH" is the mountpoint of the mounted drive
```

### 2. Locate a directory

```bash
locatefile -d arc # returns "/home/user/archives"
```

Locate file rules apply.

## Usage

1. Adjust the configurations in [configurations](configurations).
2. Define the databases' file and directory paths in [FILEPATHS](FILEPATHS).
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


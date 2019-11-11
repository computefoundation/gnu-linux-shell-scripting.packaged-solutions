
# Locatefile

Locate a file or directory from a database.

## Databases

The database consists of file and directory paths stored in text documents.

[locatefile](locatefile) searches the file paths by default and the directory paths via switch `-d` given part of a file name.

## Examples

### 1. Locate a file

Locate a file by its prefix; the matched file in the database will be returned.

```bash
locatefile my-doc # returns "/home/user/documents/my-document.txt"
```

Locate a file using any part of its name.

```bash
locatefile roj # returns "/home/user/archives/backup/projects.txt"
```

Locate a file in a mounted drive (requires setting up mounpoint paths; see [CONFIGURATIONS](CONFIGURATIONS) for more details).

```bash
locatefile my-notes # returns "MNTPNT_PATH/general/notes/my-notes.txt", where "MNTPNT_PATH" is
                    # one of the mountpoint paths specified in CONFIGURATIONS
```

### 2. Locate a directory

```bash
locatefile -d arc # returns "/home/user/archives"
```

Locate file rules apply.

## Usage

1. Adjust any needed configurations in [CONFIGURATIONS](CONFIGURATIONS).
2. Define the files and directories to output to the database in [FILEPATHS](FILEPATHS).
3. Run [updatedb](updatedb).

## Notes

Locatefile...

* ...accepts regular expressions.
* ...does not support file names with spaces.

## Download

Run the following command to download Locatefile:

```bash
bash <(curl -s 'https://raw.githubusercontent.com/computingfoundation/'\
'gnu-linux-shell-usage.packaged-solutions/helper_scripts/cf-glsu.ps-download-locatefile.sh')
```


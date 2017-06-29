
# Locate

Locate a file or directory from a database.

This utility is created entirely in bash with grep, simple and fast.

## Databases

There are two databases, one for files and one for directories consisting of file and directory paths, respectively. They are populated by output paths defined in *updatedb*.

*locate* searches the files database by default and the directories database with switch `-d`.

*Note: The predefined output paths in **updatedb** and the precreated databases **dirsdb** and **filesdb** are provided just as examples.*

## Set up

Three things have to be done to use *locate*:

1. Assign the correct values for the variables in *CONSTANTS.sh*.
2. Define the output paths in *updatedb*.
3. Run *updatedb*.

At this point, *locate* can be used as shown in the examples below.

## Examples *(based on the precreated databases)*

Locate a file.

```bash
locate book
# returns /home/<user>/archived_data/backup/bookmarks.html
```

Locate a file *(in a mounted drive [assuming the correct one is mounted]; see the *MNTPNT_PATHS* variable description in *CONSTANTS.sh* for more information)*.

```bash
locate urls.t
# returns {MNTPNT_PATH}/general/reference/website_urls.txt where {MNTPNT_PATH} is the mountpoint of
# the mounted drive
```

Locate a directory.

```bash
locate -d pic
# returns /home/<user>/pictures
```

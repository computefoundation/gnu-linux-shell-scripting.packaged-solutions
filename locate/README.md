
# Locate

Locate a file or directory from a database.

This utility is created entirely in bash and grep.

## Databases

There are two databases, one for file paths and one for directory paths. Each database is simply made up of text files consisting of paths. These databases are populated with updatedb.

Locate searches the file paths database by default and the directory paths database with the "-d" switch.

## Usage

To set up the databases, only three things have to be done:

1. Assign the correct values for variables in CONSTANTS.sh.
2. Define the output paths in updatedb.
3. Run updatedb.

After the databases have been set up, the locate script can be run.

The predefined output paths in updatedb and the precreated database files are
provided just as examples.

# Backup Script

This script creates compressed backups of a source directory and stores them in a specified backup directory. 
It includes validation, timestamped filenames, and logging of success or failure.

---

## What the script does

- Validates that both source and backup directories are provided as arguments.
- Automatically creates the backup directory if it does not exist.
- Generates a timestamped `.tar.gz` archive of the source directory.
- Logs the result (SUCCESS or ERROR) with timestamps.
- Stores all logs inside the backup directory.

---

## Usage

Run the script with:

```bash
./backup.sh <source_dir> <backup_dir>

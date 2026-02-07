#!/bin/bash

#===============================
# SIMPLE BACKUP SCRIPT
#===============================

#Arguments
source_dir="$1"
backup_dir="$2"

#Validation
if [ -z "$source_dir" ] || [ -z "$backup_dir" ]; then
    echo "Usage: $0 <source_dir> <backup_dir>"
    exit 1
fi

#Timestamping
Date=$(date +"%Y-%m-%d_%H-%M-%S")
backup_file="backup_${Date}.tar.gz"

#Check file Backup exist
if [ ! -d "$backup_dir" ]; then
    mkdir -p "$backup_dir"
fi

#Execution
tar -czf "${backup_dir}/${backup_file}" "${source_dir}"
STATUS=$?

#Logging
logfile="${backup_dir}/backup.log"

if [ $STATUS -eq 0 ]; then
    echo "$(date +%Y-%m-%d %H-%M-%S) - SUCCESS - backup created: ${backup_file}" >> "$logfile"
    echo "Backup completed succesfully."
else
    echo "$(date +%Y-%m-%d %H-%M-%S) - ERROR - backup failed for ${source_dir}" >> "$logfile"
    echo "Backup failed."
fi





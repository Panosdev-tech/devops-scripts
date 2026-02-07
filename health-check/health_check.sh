#!/bin/bash

SERVICE="ssh"
LOGFILE="health_check.log"

# 1. Ελέγχουμε αν το service είναι ενεργό
if systemctl is-active --quiet "$SERVICE"; then
    echo "$(date +"%Y-%m-%d %H:%M:%S") - OK - $SERVICE is running" >> "$LOGFILE"
    echo "$SERVICE is running"
else
    echo "$(date +"%Y-%m-%d %H:%M:%S") - FAIL - $SERVICE is NOT running" >> "$LOGFILE"
    echo "$SERVICE is NOT running"
fi


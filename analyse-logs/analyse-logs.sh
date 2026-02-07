#!/bin/bash

# --- Configuration ---
LOG_DIR="/home/to/path"
ERROR_PATTERNS=("ERROR" "FATAL" "CRITICAL")
REPORT_FILE="/home/to/path/log_analysis_report.txt"

# --- Report Header ---
{
    echo "Log Analysis Report"
    echo "Generated on: $(date)"
    echo "======================================="
    echo
    echo "List of log files updated in last 24 hours:"
} > "$REPORT_FILE"

# --- Step 1: Identify recent log files ---
LOG_FILES=$(find "$LOG_DIR" -type f -name "*.log" -mtime -1 2>/dev/null)

echo "$LOG_FILES" >> "$REPORT_FILE"

# If no log files found
if [ -z "$LOG_FILES" ]; then
    echo -e "\nNo log files updated in the last 24 hours." >> "$REPORT_FILE"
    exit 0
fi

# --- Step 2: Process each identified log file ---
for LOG_FILE in $LOG_FILES; do
    {
        echo
        echo "---------------------------------------"
        echo "Analyzing file: $LOG_FILE"
        echo "---------------------------------------"
    } >> "$REPORT_FILE"

    for PATTERN in "${ERROR_PATTERNS[@]}"; do
        echo -e "\nsearching $PATTERN logs in $LOG_FILE"  >> "$REPORT_FILE"

        # Append matching lines (suppress grep warnings)
        grep "$PATTERN" "$LOG_FILE" 2>/dev/null >> "$REPORT_FILE"

        # Count occurrences
        ERROR_COUNT=$(grep -c "$PATTERN" "$LOG_FILE" 2>/dev/null)

        echo "$ERROR_COUNT" >> "$REPORT_FILE"

        # --- Step 3: Alerting ---
        if [ "$ERROR_COUNT" -gt 10 ]; then
            echo "ALERT: Too many '$PATTERN' in $LOG_FILE" >> "$REPORT_FILE"
        fi
    done
done

echo -e "\nLog analysis completed. Report saved at: $REPORT_FILE"


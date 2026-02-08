# Log Analysis Script

This script analyzes log files inside a specific directory, 
detects recently updated files, and searches for error patterns.  
At the end, it generates a detailed report with results and alerts.

---

## What the script does

- Finds all `.log` files that were updated within the last 24 hours.
- Analyzes each file for specific error patterns:
  - `ERROR`
  - `FATAL`
  - `CRITICAL`
- Records:
  - the files that were found
  - the lines matching each pattern
  - the number of occurrences
- Generates a `.txt` report
- Displays an alert when an error pattern appears more than 10 times

---

## Structure

- `LOG_DIR` → Directory containing the log files  
- `ERROR_PATTERNS` → List of patterns to search for  
- `REPORT_FILE` → The final generated report  

---

## How to use

1. Update the paths inside the script:

```bash
LOG_DIR="/home/to/path"
REPORT_FILE="/home/to/path/log_analysis_report.txt"


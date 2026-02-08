# Health Check Script

This script checks whether a specific system service (default: `ssh`) is running and logs the result with timestamps. 
It is designed for simple service monitoring and can be used together with cron for automated periodic checks.

---

## What the script does

- Checks if a systemd service is active using `systemctl`.
- Logs the result (`OK` or `FAIL`) with timestamps.
- Prints the service status to the terminal.
- Creates the log file automatically if it does not exist.

---

## Default configuration

- `SERVICE="ssh"` → The service being monitored. 
- `LOGFILE="health_check.log"` → Log file where results are stored. 

You can change the service name to monitor something else, for example:

```bash
SERVICE="nginx"

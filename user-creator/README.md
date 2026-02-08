# User Creation Script

This script reads a list of usernames from a text file and creates the corresponding users on the system. 
It includes validation, logging, and checks for existing accounts to avoid duplicates.

---

## What the script does

- Reads usernames from `users.txt`
- Skips empty lines
- Checks if each user already exists
- Creates new users using `useradd`
- Logs all actions with timestamps:
  - `SUCCESS` when a user is created
  - `SKIP` when a user already exists
  - `ERROR` if creation fails

---

## File structure

- `users.txt` → Input file containing one username per line.
- `user_creator.log` → Log file with all actions and timestamps.

Example `users.txt`:


#!/bin/bash

# Ορίζουμε το αρχείο εισόδου
USER_FILE="users.txt"

# Ελέγχουμε εάν υπάρχει το αρχείο
if [ ! -f "$USER_FILE" ]; then
    echo "Input file not found: $USER_FILE"
    exit 1
fi

# Ορίζουμε το log file
LOGFILE="user_creator.log"

# Διαβάζουμε το αρχείο
while IFS= read -r USER; do

    # Αν η γραμμή είναι άδεια. Προσπέρασε την.
    if [ -z "$USER" ]; then
        continue
    fi

    # Έλεγχος εάν ο χρήστης υπάρχει ήδη.
    if id "$USER" &>/dev/null; then
        echo "$(date +"%Y-%m-%d %H:%M:%S") -SKIP- user already exists: $USER" >> "$LOGFILE"
        continue
    fi

    # Δημιουργία χρήστη
    useradd "$USER"
    STATUS=$?

    # Έλεγχος επιτυχίας
    if [ $STATUS -eq 0 ]; then
        echo "$(date +"%Y-%m-%d %H:%M:%S") -SUCCESS- User created: $USER" >> "$LOGFILE"
    else
        echo "$(date +"%Y-%m-%d %H:%M:%S") -ERROR- Failed to create user: $USER" >> "$LOGFILE"
    fi        
done < "$USER_FILE"

echo "User creation process completed."
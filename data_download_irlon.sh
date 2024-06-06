#!/bin/bash

USERNAME="username"
PASSWORD="password"
LOGIN_URL="https://irlon.org/auth/login.php?/services/download.php"
DOWNLOAD_URL="https://irlon.org/services/download.php?time=2020-09-09T00:00:00-04:00/2020-09-16T23:59:59-04:00&tz=est&standard=true&output=csv&pretty=true&qcFilter=true&parameters[]=IRL-FP-WQ+CDOM"

# Create a session
SESSION_ID=$(curl -s -c cookies.txt "$LOGIN_URL" | grep -oP '(?<=PHPSESSID=)[^;]+')

# Log in to the website
curl -s -b cookies.txt -d "email=$USERNAME&password=$PASSWORD&login-btn=Login" "$LOGIN_URL" > /dev/null

# Download the CSV file
curl -s -b cookies.txt "$DOWNLOAD_URL" > data.csv

if [ $? -eq 0 ]; then
    echo "CSV data downloaded successfully!"
else
    echo "Failed to download CSV data."
fi
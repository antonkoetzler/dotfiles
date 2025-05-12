#!/bin/sh
#
# Starts the local Prolog API.
#
# Run setup_local_prolog_api.sh before this script.

# Grab the BD_NAME from the result of setup_local_prolog_api.sh.
read -p "BD_NAME from setup_local_prolog_api.sh result: " bd_name

# Path to application-dev.yml.
#
# We need to update line 5 of this file.
file="$HOME/git/PrologWebService/src/main/resources/application-dev.yml"

# Check if the file exists
if [ ! -f "$file" ]; then
    echo "Error: File $file does not exist"
    exit 1
fi

# This updates line 5 of $file.
#
# Use different sed syntax based on OS type (macOS vs Linux)
if [[ "$OSTYPE" == "darwin"* ]]; then
    # macOS requires an empty string after -i
    sed -i '' "s/name: \"\${DB_NAME:[^}]*}\"/name: \"\${DB_NAME:$bd_name}\"/" "$file"
else
    # Linux version
    sed -i "s/name: \"\${DB_NAME:[^}]*}\"/name: \"\${DB_NAME:$bd_name}\"/" "$file"
fi

# Checking if updating the process was done successfully.
if [ $? -ne 0 ]; then
    echo "Error updating $file."
    exit 1
fi

# Maven commands.
cd ~/git/PrologWebService
mvn clean install -DskipTests
mvn spring-boot:run -Dspring-boot.run.profiles=dev

# Make terminal cd to ~/git/PrologWebService after the script runs
$SOURCE

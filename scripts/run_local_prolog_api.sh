#!/bin/sh
#
# Starts the local Prolog API.
#
# Run setup_local_prolog_api.sh before this script.

# Default value for bd_name
bd_name=""

# Parse arguments
while [ "$#" -gt 0 ]; do
    case "$1" in
        --name)
            bd_name="$2"
            shift 2
            ;;
        *)
            echo "Unknown option: $1"
            exit 1
            ;;
    esac
done

# Path to application-dev.yml.
file="$HOME/git/PrologWebService/src/main/resources/application-dev.yml"

# Check if the file exists
if [ ! -f "$file" ]; then
    echo "Error: File $file does not exist"
    exit 1
fi

# Only update the file if bd_name is provided
if [ -n "$bd_name" ]; then
    if [[ "$OSTYPE" == "darwin"* ]]; then
        sed -i '' "s/name: \"\${DB_NAME:[^}]*}\"/name: \"\${DB_NAME:$bd_name}\"/" "$file"
    else
        sed -i "s/name: \"\${DB_NAME:[^}]*}\"/name: \"\${DB_NAME:$bd_name}\"/" "$file"
    fi

    if [ $? -ne 0 ]; then
        echo "Error updating $file."
        exit 1
    fi
else
    echo "No --name provided; skipping file update."
fi

# Maven commands
cd ~/git/PrologWebService || exit 1
export JAVA_HOME=/opt/homebrew/opt/openjdk@17
mvn clean install -Dmaven.test.skip=true
# mvn spring-boot:run -Dspring-boot.run.profiles=dev
mvn spring-boot:run -Dspring-boot.run.profiles=dev -Dmaven.test.skip=true

# Final shell behavior
$SOURCE

#!/bin/bash

# Description:
# Create a new realm using client configured in the master realm

############################ FUNCTIONS ############################
askMissingParams()
{
    if [ -z "${HOFUND_REALM}" ]; then echo "Environment variable \$HOFUND_REALM is empty, please set this before running the script" && exit 1; fi
    if [ -z "$1" ]; then echo "Client name not set, please set this before running the script" && exit 1; fi
}

run()
{
    echo "Running add of $1 client"
}

############################## MAIN ###############################
askMissingParams $1
run $1
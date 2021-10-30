#!/bin/bash

# Description:
# Create a new realm using client configured in the master realm

############################ FUNCTIONS ############################
askMissingParams()
{
    if [ -z "${KEYCLOAK_REALM}" ]; then echo "Environment variable \$KEYCLOAK_REALM is empty, please set this before running the script" && exit 1; fi
    if [ -z "${KEYCLOAK_CLIENT}" ]; then echo "Environment variable \$KEYCLOAK_CLIENT is empty, please set this before running the script" && exit 1; fi
}

run()
{
    echo "Running add of ${KEYCLOAK_CLIENT} client to realm ${KEYCLOAK_REALM}"
}

############################## MAIN ###############################
askMissingParams
run
M = $(shell printf "\033[34;1m▶\033[0m")

.PHONY: help
help: ## Prints this help message
	@grep -E '^[a-zA-Z_-]+:.?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

######################
### MAIN FUNCTIONS ###
######################

.PHONY: check_realm
check_realm:
ifeq (${KEYCLOAK_REALM},)
	$(error KEYCLOAK_REALM is not set !(Use "KEYCLOAK_REALM=XXX"))
endif
	$(info $(M) KEYCLOAK_REALM Used : ${KEYCLOAK_REALM})

.PHONY: check_client
check_client:
ifeq (${KEYCLOAK_CLIENT},)
	$(error KEYCLOAK_CLIENT is not set !(Use "KEYCLOAK_CLIENT=XXX"))
endif
	$(info $(M) KEYCLOAK_CLIENT Used : ${KEYCLOAK_CLIENT})

.PHONY: example_commands
example_commands: ## List example commands
	$(info $(M) Example for client creation : KEYCLOAK_REALM=XXX KEYCLOAK_CLIENT=XXX create_client)

.PHONY: create_client
create_client: ## Create client (connector)
	$(MAKE) check_realm check_client
	$(info $(M) Create client (connector) for : ${CLIENT})
	./scripts/create_client.sh 

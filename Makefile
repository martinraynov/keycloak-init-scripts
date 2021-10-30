M = $(shell printf "\033[34;1m▶\033[0m")

.PHONY: help
help: ## Prints this help message
	@grep -E '^[a-zA-Z_-]+:.?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

######################
### MAIN FUNCTIONS ###
######################

.PHONY: get_realm
get_realm: ## Check realm used (error if not set)
ifeq (${KEYCLOAK_REALM},)
	$(error KEYCLOAK_REALM is not set !(Use "make set_realm"))
endif
	$(info $(M) KEYCLOAK_REALM Used : ${KEYCLOAK_REALM})

.PHONY: set_realm
set_realm: ## Set Realm to use
	$(info $(M) Use : export KEYCLOAK_REALM=XXX to set the realm that you will use)

.PHONY: create_client
create_client: ## Create client (connector)
	$(MAKE) get_realm
	$(info $(M) Create client (connector) )
	./scripts/create_client.sh

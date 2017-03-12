export DISPLAY_SKIPPED_HOSTS := 0
export ANSIBLE_NOCOWS := 1

INVENTORIES = development test

INVENTORY := development
ANSIBLE_OPTIONS :=

install:
	@echo Installing dependensies...
	ansible-galaxy install -r .vagrant/provision/requirements.yml

$(INVENTORIES):
	$(eval INVENTORY := $@)
	@echo Forced ${INVENTORY} environment


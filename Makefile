THIS_FILE:=$(lastword $(MAKEFILE_LIST))
DOCKER=sudo docker
DOCKER-COMPOSE=COMPOSE_HTTP_TIMEOUT=400 sudo docker-compose

define sh-checkouts
	cd $1; \
	./checkout.sh
endef

all: checkout build

checkout:		## Checkout required source code
	$(call sh-checkouts,$(shell pwd)/etebase)
	$(call sh-checkouts,$(shell pwd)/web)

build:			## Build the containers
	$(DOCKER-COMPOSE) build

rund:			## Run the apps in background
	$(DOCKER-COMPOSE) up -d

run:			## Run apps in foreground
	$(DOCKER-COMPOSE) up

migrate-db:		## Migrate db
	$(DOCKER-COMPOSE) exec etebase ./manage.py migrate	

create-superuser:	## Create super user
	$(DOCKER-COMPOSE) exec etebase ./manage.py createsuperuser

add-dav-user:		## Add DAV user e.g. make add-dav-user user=dmoraschi
	$(DOCKER-COMPOSE) exec etedav ./etesync-dav manage add $(user)

install: 		## Install e.g. make install user=dmoraschi
install: migrate-db create-superuser add-dav-user

help:			## Show this help.
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//'
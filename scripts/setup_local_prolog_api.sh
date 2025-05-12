#!/bin/sh
#
# Executes Docker file to setup the api (run migrations) for use.
docker-compose -f $HOME/git/PrologWebService/sql/prolog_setup_db/docker/docker-compose.yml up

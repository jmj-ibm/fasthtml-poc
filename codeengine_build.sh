#!/bin/bash

export BX_API_KEY=<valid_api_key>
export REGION='eu-gb'
export RESOURCE_GROUP='technology-experiences'
export NAMESPACE='research3'
export PROJECT_NAME='fasthtml-poc3'
export SECRET_NAME='pc3-secret'
export REGISTRY_SERVER='private.uk.icr.io'
export APP_NAME='poc3'
export APP_SOURCE='https://github.com/jmj-ibm/fasthtml-poc'
export APP_PORT=5001

# log in
bx login --apikey $BX_API_KEY

# select region
bx target -r $REGION

# select resource group
bx target -g $RESOURCE_GROUP

# log in to container registry
bx cr login

# create project
bx ce project create -n $PROJECT_NAME -e public

# - before we can create an app we need to create a registry secret:
bx ce registry create -n $SECRET_NAME -s $REGISTRY_SERVER -u iamapikey -p $BX_API_KEY

# - we want to create an app from a public github repo
bx ce app create -n $APP_NAME --cm main --src $APP_SOURCE -p $APP_PORT -rs $SECRET_NAME --cpu 1 --memory 4G --image $REGISTRY_SERVER/$NAMESPACE/$APP_NAME


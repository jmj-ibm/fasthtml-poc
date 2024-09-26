#!/bin/bash

export BX_API_KEY=$API_KEY
export REGION=$REGION
export RESOURCE_GROUP=$RESOURCE_GROUP
export NAMESPACE=$NAMESPACE
export PROJECT_NAME=$PROJECT_NAME
export SECRET_NAME=$SECRET_NAME
export REGISTRY_SERVER=$REGISTRY_SERVER
export APP_NAME=$APP_NAME
export APP_SOURCE=$APP_SOURCE
export APP_PORT=$APP_PORT

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


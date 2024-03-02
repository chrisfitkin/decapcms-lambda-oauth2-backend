#!/bin/bash

# Load environment variables from .env file
if [ -f .env ]; then
    export $(cat .env | xargs)
else 
    echo ".env file not found"
    exit 1
fi

# Put OAUTH_GITHUB_CLIENT_ID parameter
aws ssm put-parameter \
    --type 'String' \
    --name '/CDK/DecapCMSOAuthBackend/OAUTH_GITHUB_CLIENT_ID' \
    --value "$OAUTH_GITHUB_CLIENT_ID"

# Put OAUTH_GITHUB_CLIENT_SECRET parameter
aws ssm put-parameter \
    --type 'String' \
    --name '/CDK/DecapCMSOAuthBackend/OAUTH_GITHUB_CLIENT_SECRET' \
    --value "$OAUTH_GITHUB_CLIENT_SECRET"

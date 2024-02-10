#!/bin/bash

# Pantheon organization ID
ORG_ID=ORG_ID_HERE

# List all sites in the organization
SITES=$(terminus org:site:list $ORG_ID --format=list --field=name)

# Loop through each site
for SITE in $SITES; do
    echo "Deploying updates for site $SITE"

    echo "Applying upstream updates to dev"
    terminus upstream:updates:apply $SITE.dev

    # Deploy code to test environment
    echo "Deploying code to test"
    terminus env:deploy $SITE.test --note="Deploying code via script"

    # Deploy code to live environment
    echo "Deploying code to live"
    terminus env:deploy $SITE.live --note="Deploying code via script"

    # Run update.php
    echo "Running update.php"
    terminus remote:drush $SITE.live updb -y

    # Clear caches
    echo "Clearing caches"
    terminus remote:drush $SITE.live cr
done

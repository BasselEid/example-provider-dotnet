#!/bin/bash

source=$1


echo $source

# Define the file paths
orb_file=".circleci/my-orb.yml"
config_file=".circleci/webhookconfig.yml"

case $source in 
    webhook) config_file=".circleci/webhookconfig.yml" ;;
    *) config_file=".circleci/normalconfig.yml" ;;
esac

echo $config_file

# Check if the orb file exists
if [ ! -f "$orb_file" ]; then
  echo "Error: $orb_file not found."
  exit 1
fi

# Check if the config file exists
if [ ! -f "$config_file" ]; then
  echo "Error: $config_file not found."
  exit 1
fi

# Read the contents of the orb file
orb_content=$(<"$orb_file")


echo "$orb_content" | cat - "$config_file"
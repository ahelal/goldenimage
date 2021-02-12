#!/bin/bash
set -e

# install
bundle install

# conv 
bundle exec kitchen conv

# verify
bundle exec kitchen verify

# destroy
bundle exec kitchen destroy

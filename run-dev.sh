#!/usr/bin/env bash

export RAILS_ENV=development
export RAILS_LOG_LEVEL=0 
export RAILS_MAX_THREADS=3 

if ! command -v foreman &> /dev/null
then
  echo "Installing foreman..."
  gem install foreman
fi

foreman start -f Procfile.dev

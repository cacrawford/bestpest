#!/bin/bash

sleep 10

# Installs dependencies
mix deps.get

# Initial migrations
mix ecto.migrate

# NPM installation
npm install

# Runs the server
mix phoenix.server

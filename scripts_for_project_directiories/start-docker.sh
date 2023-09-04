#!/bin/bash

# Function to check if a port is in use
port_in_use() {
  local port="$1"
  if [ -n "$(netstat -tuln | grep ":$port")" ]; then
    return 0 # Port is in use
  else
    return 1 # Port is not in use
  fi
}

# Get the name of the current directory (the script's parent directory)
container_name="$(basename "$(pwd)")"
port=3001

# Check if the port is already in use
if port_in_use "$port"; then
  echo "Port $port is already in use. Please choose a different port."
  exit 1
fi

# Build a Docker image from the Dockerfile in the current directory
docker build -t "$container_name" .

# Run a container from the built image and map port 3001
docker run -dp "$port:3001" --name "$container_name" "$container_name"
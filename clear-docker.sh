#!/bin/bash

# Stop all running Docker containers
docker stop $(docker ps -aq)

# Remove all Docker containers, both running and stopped
docker rm $(docker ps -aq)

# Remove all Docker images
docker rmi $(docker images -q)

# Remove all Docker volumes
docker volume rm $(docker volume ls -q)

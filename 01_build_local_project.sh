#!/bin/sh

echo "Existing containers - destroying..."
docker stop $(docker container ls --format "{{.Names}}" | grep todo_backend)
docker rm $(docker container ls --format "{{.Names}}" | grep todo_backend)
docker compose down
echo "Existing containers - done!"

echo

echo "Volumes - destroying..."
docker volume rm $(docker volume ls -f dangling=true)
echo "Volumes - done!"

echo

echo "Images - building..."
docker rmi $(docker images -f dangling=true)
docker rmi todo_backend
docker system prune -a -f --volumes
docker compose build backend
echo "Images - done!"

# How to run:
# bash 01_build_local_project.sh
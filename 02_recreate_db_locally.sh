#!/bin/sh

echo

echo "DB - droping..."
docker compose run --rm backend rails db:drop
echo "DB - done!"

echo

echo "DB - creating..."
docker compose run --rm backend rails db:create
echo "DB - done!"

echo

echo "DB - migrating..."
docker compose run --rm backend rails db:migrate
echo "DB - done!"

# How to run:
# bash 02_recreate_db_locally.sh
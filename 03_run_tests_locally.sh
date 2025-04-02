#!/bin/sh

echo "Existing containers - destroying..."
docker stop db
docker rm db
docker compose down
echo "Existing containers - done!"

docker compose run --rm backend rails db:drop db:create db:migrate
docker compose run --rm backend rspec

# How to run:
# bash 03_run_tests_locally.sh
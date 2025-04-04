#!/bin/sh

bash 01_build_local_project.sh

bash 02_recreate_db_locally.sh

echo "Karafka Web - migrating..."
docker compose run --rm backend bundle exec karafka-web migrate
echo "Karafka Web - done!"

echo "backend - starting..."
docker compose up backend -d
docker compose up consumer -d
docker logs --follow backend

# How to run:
# bash 04_recreate_project_locally.sh
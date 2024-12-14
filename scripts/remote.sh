set +e

set -a            
source ../.env
set +a

DOCKER_INSTANCE_ID=$(docker ps -aqf "name=$DOCKER_CONTAINER_NAME")
docker exec -i $DOCKER_INSTANCE_ID rcon-cli
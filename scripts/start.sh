set -e

set -a
source .env
set +a

DOCKER_INSTANCE_ID=$(docker ps -aqf "name=$DOCKER_CONTAINER_NAME")

echo "To delete the minecraft server and all it's data, run the file 'delete.sh' found in '/scripts'. You can do this with either bash, zsh or sh depending on your OS. I.e. 'bash scripts/delete.sh'."
echo ""

# Checks if a server is already running
if [ "$(docker container inspect -f '{{.State.Status}}' $DOCKER_CONTAINER_NAME)" = "running" ]; then
  while true; do
    read -p "There is already a server running. Do you wish to restart it? " yn
    case $yn in
    [Yy]*)
      docker-compose down && docker-compose up -d || true
      break
      ;;
    [Nn]*) exit ;;
    *) echo "Please answer yes or no." ;;
    esac
  done

else
  docker-compose up -d
fi

DOCKER_INSTANCE_ID=$(docker ps -aqf "name=$DOCKER_CONTAINER_NAME")
DOCKER_INSTANCE_IP_ADDR=$(docker inspect $DOCKER_INSTANCE_ID | grep -w "IPAddress" | awk '{print $2}' | tr -d ',"' | xargs)

echo "- - -"
echo "Successful docker build. Server will attempt to start shortly."
echo "Docker Instance ID: $DOCKER_INSTANCE_ID | Local IP Addr: $DOCKER_INSTANCE_IP_ADDR | Port: $MC_PORT"
echo "- - -"
echo "To access the docker container terminal use the command: 'docker exec -it $DOCKER_CONTAINER_NAME bash'. Type 'exit' into the terminal to leave once you've remoted in."
echo "To access the minecraft terminal run the file 'remote.sh' found in '/scripts'. You can do this with either bash, zsh or sh depending on your OS. I.e. 'bash scripts/remote.sh'."
echo "- - -"
echo "If you encounter any issues or the server isn't loading up correctly, you can access the logs of the container using the command 'docker attach $DOCKER_CONTAINER_NAME'. To exit without closing the instance, press Ctrl+P followed by Ctrl+Q."

set -e

set -a            
source .env
set +a

echo "WARNING! You are trying to stop the server then delete it's associated volume. This will destroy ALL data. This is irreversible. Your world file, player data and plugin configs will not be recoverable. "
echo ""
while true; do
    read -p "Are you sure you wish to delete the server? " yn
    case $yn in
        [Yy]* ) docker-compose down -v || true; break;;
        [Nn]* ) exit;;
        * ) echo "Please answer yes or no.";;
    esac
done


set -e

set -a
source .env
set +a

echo "Stopping server."
echo ""
docker-compose down

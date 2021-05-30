# REMOVE ALL CONTAINERS
docker rm -f $(docker ps -q)

# CREATE CONTAINERS MYSQL AND NGINX
docker-compose up -d

sleep 3

#  ASSIGN IP NGNIX CONTAINER
IP_NGINX_CONTAINER=http://$(docker inspect --format='{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' mba-as02-nginx)
echo "\nIP NGNIX CONTAINER: $IP_NGINX_CONTAINER"

# HEALTH CHECK NGINX CONTAINER
echo "\n\nHEALTH CHECK NGINX CONTAINER"
docker ps -f status=running -f name=mba-as02-nginx

# HEALTH CHECK NGINX CONTAINER
echo "\n\nHEALTH CHECK NGINX CONTAINER PORT 80"
curl --url "http://localhost" | grep nginx.com

# CURL REMOTE FROM CONTAINER NGINX TO CONTAINER MYSQL
echo "\n\nCURL REMOTE FROM CONTAINER NGINX TO CONTAINER MYSQL"
docker exec -it mba-as02-nginx mysql -uroot -ppassword123! -hmba-as02-data
all: docker-build docker-compose-up
net: docker-compose-down docker-image-delete docker-build docker-compose-up

docker-build:
	docker build . -t console/web-gateway-service

docker-compose-up:
	docker-compose up -d

docker-compose-down:
	docker-compose down

docker-stop:
	docker stop web-gateway-service

docker-delete:
	docker rm web-gateway-service

docker-image-delete:
	docker rmi console/web-gateway-service
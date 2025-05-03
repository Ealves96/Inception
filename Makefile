all:
	@sudo mkdir -p /home/ealves/data/mariadb
	@sudo mkdir -p /home/ealves/data/wordpress
	@sudo docker compose -f ./srcs/docker-compose.yml up -d --build

re:
	@sudo docker compose -f srcs/docker-compose.yml up -d --build

clean:
	@sudo docker compose -f ./srcs/docker-compose.yml down -v
	@sudo docker system prune -af;
	@sudo rm -rf /home/ealves/data

.PHONY: all re down clean
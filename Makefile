all:
	sudo mkdir -p /home/lfallon/data/mariadb/ /home/lfallon/data/wordpress/ /home/lfallon/data/html/
	# sudo sed -i 's/127.0.0.1    localhost/127.0.0.1    lfallon.42.fr/' /etc/hosts
	docker-compose -f srcs/docker-compose.yml up -d
stop:
	docker-compose -f srcs/docker-compose.yml stop
start:
	docker-compose -f srcs/docker-compose.yml start
restart:
	docker-compose -f srcs/docker-compose.yml restart
pause:
	docker-compose -f srcs/docker-compose.yml pause
build:
	docker-compose -f srcs/docker-compose.yml build
logs:
	docker-compose -f srcs/docker-compose.yml logs
version:
	docker-compose version
ps:
	docker-compose ps
ls:
	docker volume ls
network:
	docker network ls
show:
	docker-compose -f srcs/docker-compose.yml start mariadb
	docker exec -it mariadb mysql -u root -p
clean:
	docker-compose -f srcs/docker-compose.yml down
fclean: clean
	sudo rm -rf /home/lfallon/data
	sudo sed -i 's/127.0.0.1    lfallon.42.fr/127.0.0.1    localhost/' /etc/hosts
	sudo docker volume rm $$(sudo docker volume ls -q)
	sudo docker rmi -f $$(sudo docker images -qa)
	sudo docker system prune -a

.PHONY: all stop start restart build ps ls network pause show version clean fclean
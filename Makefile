all:	up
			@echo "###### DON'T FORGET TO ADD .ENV IN GITIGNORE ######"

up:
			docker-compose -f srcs/docker-compose.yml up --build

stop:
			docker-compose -f srcs/docker-compose.yml down

clean_volumes:
					docker volume rm $$(docker volume ls -q)
					sudo rm -rf /home/william/data/mysql/* /home/william/data/wordpress/*

prune:
			docker system prune -a

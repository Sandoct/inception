# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: r <marvin@42.fr>                           +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/07/29 15:18:27 by r                 #+#    #+#              #
#    Updated: 2024/07/29 15:18:32 by r                ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

WP_DATA = /home/gpouzet/data/wordpress
DB_DATA = /home/gpouzet/data/mariadb

all: up

up: build
	@mkdir -p $(WP_DATA)
	@mkdir -p $(DB_DATA)
	docker compose -f ./srcs/docker-compose.yml up -d

build:
	docker compose -f ./srcs/docker-compose.yml build

clean:
	docker compose -f ./srcs/docker-compose.yml down
	@rm -rf $(WP_DATA)
	@rm -rf $(DB_DATA)

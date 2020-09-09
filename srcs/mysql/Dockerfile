# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: imicah <marvin@42.fr>                      +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/09/07 12:42:12 by imicah            #+#    #+#              #
#    Updated: 2020/09/09 01:25:17 by imicah           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM	alpine:3.7

RUN		apk update && \
		apk add mysql mysql-client \
		 		vim bash openrc

COPY	src/my.cnf		/etc/mysql/my.cnf
COPY	src/config.sql	.

VOLUME	["sys/fs/cgroup"]

RUN		rc default && /etc/init.d/mariadb setup

#RUN		mysql -u root < config.sql

EXPOSE	3306

ENTRYPOINT	usr/bin/mysqld_safe


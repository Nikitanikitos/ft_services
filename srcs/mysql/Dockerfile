# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: imicah <marvin@42.fr>                      +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/09/07 12:42:12 by imicah            #+#    #+#              #
#    Updated: 2020/09/15 21:48:24 by imicah           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM	alpine:3.7

RUN		apk update && \
		apk add mysql mysql-client openrc

COPY	src/my.cnf			/etc/mysql/my.cnf
COPY	src/start.sh		start.sh
COPY	src/wordpress.sql	wordpress.sql

VOLUME	["sys/fs/cgroup"]
VOLUME	["/var/lib"]

EXPOSE	3306

ENTRYPOINT	./start.sh

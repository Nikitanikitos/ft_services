# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: imicah <marvin@42.fr>                      +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/09/05 20:27:57 by imicah            #+#    #+#              #
#    Updated: 2020/09/06 23:51:32 by imicah           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM	alpine:3.7

RUN		apk update && \
		apk add openrc nginx bash vim \
				php7 php7-fpm \
				supervisor && \
		rc-update add php-fpm7 default

RUN		mkdir -p /run/nginx
RUN		mkdir -p /var/run/php

RUN		sed -i 's/;daemonize = yes/daemonize = no/g' /etc/php7/php-fpm.conf

COPY	src/wordpress.conf		/etc/nginx/conf.d/wordpress.conf
COPY	src/supervisord.conf	/etc/supervisord.conf

RUN		wget https://wordpress.org/latest.tar.gz
RUN		tar -xf latest.tar.gz
RUN		rm -rf latest.tar.gz
RUN		mv wordpress /var/www/wordpress

EXPOSE	9000 5050

CMD		["usr/bin/supervisord", "-c", "/etc/supervisord.conf"]


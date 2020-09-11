# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: imicah <marvin@42.fr>                      +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/09/05 20:27:46 by imicah            #+#    #+#              #
#    Updated: 2020/09/11 14:26:51 by imicah           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM	alpine:3.7

RUN		apk update && \
		apk add openrc nginx bash vim openssl\
				php7 php7-mysqli php7-session php7-fpm php7-json php7-phar php7-iconv php7-mbstring \
				supervisor && \
		rc-update add php-fpm7 default

RUN		mkdir -p /run/nginx
RUN		mkdir -p /var/run/php

RUN		sed -i 's/;daemonize = yes/daemonize = no/g' /etc/php7/php-fpm.conf
RUN		sed -i 's/;   extension=msql.so/extension=mysqli.so/g' /etc/php7/php.ini

COPY	src/phpmyadmin.conf		/etc/nginx/conf.d/phpmyadmin.conf
COPY	src/supervisord.conf	/etc/supervisord.conf

RUN		wget	https://files.phpmyadmin.net/phpMyAdmin/5.0.2/phpMyAdmin-5.0.2-english.tar.gz
RUN		tar		-xf phpMyAdmin-5.0.2-english.tar.gz
RUN		mv		phpMyAdmin-5.0.2-english var/www/phpmyadmin
RUN		rm		-rf phpMyAdmin-5.0.2-english.tar.gz
RUN		rm		-f /etc/nginx/conf.d/default.conf

COPY	src/config.inc.php		/var/www/phpmyadmin/config.inc.php

EXPOSE	9000 5000

CMD		["usr/bin/supervisord", "-c", "/etc/supervisord.conf"]


# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: imicah <imicah@student.21-school.ru>       +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/09/07 01:50:27 by imicah            #+#    #+#              #
#    Updated: 2020/09/19 16:43:53 by imicah           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM	alpine:latest

RUN		apk update

RUN		apk add --update supervisor ca-certificates && rm -rf /var/cache/apk/*
RUN		wget -q -O /etc/apk/keys/sgerrand.rsa.pub https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub
RUN		wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.28-r0/glibc-2.28-r0.apk
RUN		apk add glibc-2.28-r0.apk

RUN		wget https://dl.influxdata.com/telegraf/releases/telegraf-1.15.3_linux_amd64.tar.gz \
		&&	tar xf telegraf-1.15.3_linux_amd64.tar.gz \
		&& cp -r /telegraf-1.15.3/* / \
		&& rm -rf /telegraf-1.15.3/ telegraf-1.15.3_linux_amd64.tar.gz

COPY	src/telegraf.conf	/etc/telegraf/telegraf.conf

ENTRYPOINT	/usr/bin/telegraf --config /etc/telegraf/telegraf.conf

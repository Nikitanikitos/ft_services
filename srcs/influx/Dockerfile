# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: imicah <imicah@student.21-school.ru>       +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/09/07 01:50:27 by imicah            #+#    #+#              #
#    Updated: 2020/09/09 23:45:11 by imicah           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM	alpine:3.7

RUN		apk update

RUN		apk add --update supervisor ca-certificates && rm -rf /var/cache/apk/*
RUN		wget -q -O /etc/apk/keys/sgerrand.rsa.pub https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub
RUN		wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.28-r0/glibc-2.28-r0.apk
RUN		apk add glibc-2.28-r0.apk

RUN		wget https://s3.amazonaws.com/influxdb/influxdb-static-nightly_linux_amd64.tar.gz
RUN		mkdir -p /app /var/lib/influxdb/ && \
		tar xfz influxdb-static-nightly_linux_amd64.tar.gz -C /app && \
		rm influxdb-static-nightly_linux_amd64.tar.gz

RUN		wget https://dl.influxdata.com/telegraf/releases/telegraf-1.15.2_linux_amd64.tar.gz
RUN		tar xf telegraf-1.15.2_linux_amd64.tar.gz

RUN		cd telegraf-1.15.2/usr/bin && ./telegraf -sample-config --input-filter docker --output-filter influxdb > telegraf.conf

COPY	src/supervisord.conf	/etc/supervisord.conf

VOLUME	["/var/lib"]

CMD		["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"]

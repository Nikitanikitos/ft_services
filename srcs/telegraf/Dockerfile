# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: imicah <imicah@student.21-school.ru>       +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/09/09 22:00:12 by imicah            #+#    #+#              #
#    Updated: 2020/09/09 22:52:10 by imicah           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM	alpine:3.7

RUN		apk update && apk add bash vim

RUN		wget -q -O /etc/apk/keys/sgerrand.rsa.pub https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub
RUN		wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.28-r0/glibc-2.28-r0.apk
RUN		apk add glibc-2.28-r0.apk

RUN		wget https://dl.influxdata.com/telegraf/releases/telegraf-1.15.2_linux_amd64.tar.gz
RUN		tar xf telegraf-1.15.2_linux_amd64.tar.gz

RUN		cd telegraf-1.15.2/usr/bin && ./telegraf -sample-config --input-filter docker --output-filter influxdb > telegraf.conf

WORKDIR	telegraf-1.15.2/usr/bin

ENTRYPOINT	./telegraf --config telegraf.conf


# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: imicah <imicah@student.21-school.ru>       +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/09/08 21:10:55 by imicah            #+#    #+#              #
#    Updated: 2020/09/08 21:38:54 by imicah           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM	alpine:3.7

RUN		apk update && apk --no-cache add ca-certificates

RUN		wget -q -O /etc/apk/keys/sgerrand.rsa.pub https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub
RUN		wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.28-r0/glibc-2.28-r0.apk
RUN		apk add glibc-2.28-r0.apk

RUN		wget https://dl.grafana.com/oss/release/grafana-7.1.5.linux-amd64.tar.gz
RUN		tar -zxf grafana-7.1.5.linux-amd64.tar.gz

COPY	src/grafana.db		/grafana-7.1.5/data/grafana.db

EXPOSE	3000

WORKDIR	/grafana-7.1.5/bin/

ENTRYPOINT	./grafana-server

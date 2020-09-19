# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: imicah <imicah@student.21-school.ru>       +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/09/07 01:50:27 by imicah            #+#    #+#              #
#    Updated: 2020/09/19 16:53:09 by imicah           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM	alpine:latest

RUN		apk update && apk add influxdb

VOLUME		["/var/lib/"]

ENTRYPOINT	influxd -config /etc/influxdb.conf

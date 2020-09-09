# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: imicah <imicah@student.21-school.ru>       +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/09/07 01:50:27 by imicah            #+#    #+#              #
#    Updated: 2020/09/09 14:27:57 by imicah           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM	alpine:3.7

RUN		apk update && apk add bash vim

RUN		apk add --update wget tar ca-certificates && rm -rf /var/cache/apk/*
RUN		wget https://s3.amazonaws.com/influxdb/influxdb-static-nightly_linux_amd64.tar.gz

RUN		mkdir -p /app /var/lib/influxdb/ && \
		tar xfz influxdb-static-nightly_linux_amd64.tar.gz -C /app && \
		rm influxdb-static-nightly_linux_amd64.tar.gz

VOLUME ["/var/lib/influxdb"]

ENTRYPOINT ["app/influxdb-0.14.0~n201605060800-0/influxd"]
# CMD ["run", "-config", "/app/influxdb-0.14.0~n201605060800-0/influxdb.conf"]

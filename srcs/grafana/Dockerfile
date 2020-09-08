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

RUN		apk update

ENV		GRAFANA_HOME=/var/lib/grafana

RUN		addgroup -g 1000 -S grafana && \
		adduser -u 1000 -G grafana -h ${GRAFANA_HOME} -D grafana  

RUN		mkdir -p var/lib/grafana/
RUN		wget https://dl.grafana.com/oss/release/grafana-7.1.5.linux-amd64.tar.gz
RUN		tar -zxvf grafana-7.1.5.linux-amd64.tar.gz
RUN		mv grafana-7.1.5/*			/var/lib/grafana
RUN		mv ${GRAFANA_HOME}/bin/*	/usr/local/bin/
RUN		mkdir -p ${GRAFANA_HOME}/{dashboards,data,logs,plugins,provisioning}
RUN		ln -s /grafana/plugins		${GRAFANA_HOME}/plugins
RUN		grafana-cli plugins update-all
RUN		rm -f ${GRAFANA_HOME}/conf/*.ini
RUN		chown -R grafana:grafana ${GRAFANA_HOME}
RUN		rm -rf /var/cache/apk/* tmp/*


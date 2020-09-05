# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: imicah <marvin@42.fr>                      +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/09/05 20:26:49 by imicah            #+#    #+#              #
#    Updated: 2020/09/05 21:53:56 by imicah           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM		alpine:3.7

RUN			apk update && \
			apk add nginx openrc supervisor

RUN			mkdir -p /run/nginx

COPY		supervisord/supervisord.conf	/etc/supervisord.conf

EXPOSE		80

#CMD			["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"]
ENTRYPOINT	nginx -c /etc/nginx/nginx.conf -g "daemon off;"

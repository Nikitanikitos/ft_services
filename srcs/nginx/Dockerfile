# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: imicah <marvin@42.fr>                      +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/09/05 20:26:49 by imicah            #+#    #+#              #
#    Updated: 2020/09/06 14:00:38 by imicah           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM		alpine:3.7

RUN			apk update && \
			apk add openssl nginx \
					openrc supervisor \
					bash vim

RUN			mkdir -p /run/nginx

COPY		src/default.conf				/etc/nginx/conf.d/default.conf
COPY		src/snippets					/etc/nginx/snippets
COPY		src/index.html		/var/www/index.html
#COPY		src/supervisord/supervisord.conf	/etc/supervisord.conf
COPY		src/dhparam.pem		/etc/ssl/certs/dhparam.pem

RUN			openssl req -new -newkey rsa:2048 -nodes -x509 -days 500 -subj \
			/C=RU/ST=Moscow/L=Moscow/O=Companyname/OU=User/CN=localhost/emailAddress=support@site.com \
			-keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt


#CMD			["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"]
ENTRYPOINT	nginx -c /etc/nginx/nginx.conf -g "daemon off;"

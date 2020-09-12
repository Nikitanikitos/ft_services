# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: imicah <marvin@42.fr>                      +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/09/11 17:25:25 by imicah            #+#    #+#              #
#    Updated: 2020/09/11 17:31:17 by imicah           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM	alpine:3.7

RUN		apk update && apk add openssl vsftpd openrc
	
RUN		openssl req -x509 -nodes -days 365 -newkey rsa:1024 -subj \
		/C=RU/ST=Moscow/L=Moscow/O=Companyname/OU=User/CN=localhost/emailAddress=support@site.com \
		-keyout /etc/vsftpd/vsftpd.pem -out /etc/vsftpd/vsftpd.pem

RUN		echo 'root:root' | chpasswd

VOLUME	["sys/fs/cgroup"]

COPY	src/vsftpd.conf		/etc/vsftpd/vsftpd.conf

RUN		mkdir -p /var/log/ftp && touch /var/log/ftp/xferlog

RUN		rc default

EXPOSE	21

ENTRYPOINT	vsftpd /etc/vsftpd/vsftpd.conf

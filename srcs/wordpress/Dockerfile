# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: imicah <marvin@42.fr>                      +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/09/05 20:27:57 by imicah            #+#    #+#              #
#    Updated: 2020/09/05 22:11:41 by imicah           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM	alpine:3.7

RUN		apk update && \

RUN		mkdir -p /var/www

RUN		wget http://wordpress.org/latest.tar.gzi
RUN		tar -xf latest.tar.gzi
RUN		rm -rf latest.tar.gzi
RUN		mv wordpress /var/www

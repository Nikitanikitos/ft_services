# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    setup.sh                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: imicah <marvin@42.fr>                      +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/09/05 20:24:16 by imicah            #+#    #+#              #
#    Updated: 2020/09/07 01:29:42 by imicah           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

docker build srcs/nginx/Dockerfile -t		nginx-server
docker build srcs/phpmyadmin/Dockerfile -t	phpmyadmin
docker build srcs/wordpress/Dockerfile -t	wordpress

docker run -p 5050:5050 --name wordpress wordpress
docker run -p 5000:5000 --name phpmyadmin phpmyadmin
docker run -p 80:80 -p 443:443 -p 2222:22 --name nginx-server nginx-server


# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    setup.sh                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: imicah <marvin@42.fr>                      +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/09/05 20:24:16 by imicah            #+#    #+#              #
#    Updated: 2020/09/07 20:08:27 by imicah           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

minikube start
eval $(minikube docker-env) # не забыть проверить нужно ли

minikube addons enable metallb
minikube addons configure metallb

docker build srcs/nginx/Dockerfile -t		nginx-server
docker build srcs/phpmyadmin/Dockerfile -t	phpmyadmin
docker build srcs/wordpress/Dockerfile -t	wordpress
docker build srcs/mysq.Dockerfile -t		mysql

kubectl create -f srcs/nginx.yaml
kubectl create -f srcs/service.yaml

#docker run -p 5050:5050 --name wordpress wordpress
#docker run -p 5000:5000 --name phpmyadmin phpmyadmin
#docker run -p 80:80 -p 443:443 -p 2222:22 --name nginx-server nginx-server


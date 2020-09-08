#!/bin/bash

minikube start --vm-driver=virtualbox
eval $(minikube docker-env) 

minikube addons enable metallb
kubectl apply -f srcs/minikube_confs/metallb-configmap.yaml

#docker build srcs/nginx/ -t			nginx-image
#docker build srcs/phpmyadmin/ -t	phpmyadmin-image
docker build srcs/wordpress/ -t		wordpress-image
docker build srcs/mysq -t			mysql-image

kubectl apply -f srcs/minikube_confs/wordpress.yaml
kubectl apply -f srcs/minikube_confs/mysql.yaml
#kubectl apply -f srcs/minikube_confs/phpmyadmin.yaml
#kubectl apply -f srcs/minikube_confs/nginx.yaml


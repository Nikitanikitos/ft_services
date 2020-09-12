#!/bin/bash

services=("nginx" "phpmyadmin" "wordpress" "mysql" "influx" "grafana", "ftps")

minikube start --vm-driver=virtualbox
eval $(minikube docker-env) > /dev/null

minikube addons enable metallb
kubectl apply -f srcs/minikube_confs/metallb-configmap.yaml

for service in "${services[@]}"
do
printf "docker build ${service}: "
docker build srcs/${service} -t "${service}-image" > /dev/null
printf "status - OK\n"
done

kubectl apply -f srcs/minikube_confs/volume.yaml

for service in "${services[@]}"
do
kubectl apply -f srcs/minikube_confs/${service}.yaml
done

printf "\n"

printf "Ip address nginx: 192.168.99.101:443\n"
printf "Ip address wordpress: 192.168.99.102:5050\n"
printf "Ip address phpmyadmin: 192.168.99.103:5000\n"
printf "Ip address grafana: 192.168.99.104:3000\n"

printf "\n"

printf "URL influx: http://influxdb-svc:8086\n"
printf "URL mysql: http://mysql-svc:3306\n"


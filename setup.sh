#!/bin/bash

services=("nginx" "phpmyadmin" "wordpress" "mysql" "influx" "grafana" "ftps" "telegraf")

minikube start --vm-driver=virtualbox
eval $(minikube docker-env) > /dev/null

minikube addons enable metallb
kubectl apply -f srcs/minikube_confs/metallb-configmap.yaml

for service in "${services[@]}"
do
echo -en "\033[1mdocker build ${service}: "
if docker build srcs/${service} -t "${service}-image" 1> default.log 2> error.log
then
echo -en "status - \033[32m OK \033[0m \033[1m \n"
else
echo -en "status - \033[31m KO \033[0m \033[1m \n"
fi
done

kubectl apply -f srcs/minikube_confs/volume.yaml

for service in "${services[@]}"
do
kubectl apply -f srcs/minikube_confs/${service}.yaml
done

echo -en "\n"

echo -en "Ip address nginx: 192.168.99.101:443\n"
echo -en "Ip address wordpress: 192.168.99.102:5050\n"
echo -en "Ip address phpmyadmin: 192.168.99.103:5000\n"
echo -en "Ip address grafana: 192.168.99.104:3000\n"
echo -en "Ip address ftps: 192.168.99.105:21\n"

echo -en "\n"

echo -en "Hostname influx: http://influxdb-svc:8086\n"
echo -en "Hostname mysql: mysql-svc:3306\n\033[0m"

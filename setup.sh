#!/bin/bash

services=("nginx" "phpmyadmin" "wordpress" "mysql" "influx" "grafana", "ftps")

minikube start --vm-driver=virtualbox
eval $(minikube docker-env) > /dev/null

minikube addons enable metallb
kubectl apply -f srcs/minikube_confs/metallb-configmap.yaml

for service in "${services[@]}"
do
printf "docker build ${service}: "
if docker build srcs/${service} -t "${service}-image" > /dev/null 2 > error.log
then 
echo -en "status - \033[1m\033[32mOK\n"
else
echo -en "status - \033[1m\033[31mKO\n"
done

kubectl apply -f srcs/minikube_confs/volume.yaml

for service in "${services[@]}"
do
kubectl apply -f srcs/minikube_confs/${service}.yaml
done

echo -en "\n"

echo -en "Ip address nginx: \033[1m\192.168.99.101:443\n"
echo -en "Ip address wordpress: \033[1m\192.168.99.102:5050\n"
echo -en "Ip address phpmyadmin: \033[1m\192.168.99.103:5000\n"
echo -en "Ip address grafana: \033[1m\192.168.99.104:3000\n"
echo -en "Ip address ftps: \033[1m\192.168.99.105:21\n"

echo -en "\n"

echo -en "Hostname influx: \033[1m\http://influxdb-svc:8086\n"
echo -en "Hostname mysql: \033[1m\mysql-svc:3306\n"

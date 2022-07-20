#!/bin/bash

minikube start
minikube addons enable ingress

helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx
helm install ingress-nginx ingress-nginx/ingress-nginx
echo "waiting the ingress nginx to be ready"
kubectl wait pod -l app.kubernetes.io/name=ingress-nginx --for=condition=ready --timeout=300s
sleep 1

# build the image and load to minikube
make push
kubectl create secret tls yages-tls --key ca.key --cert ca.crt
kubectl apply -f ingress.yaml

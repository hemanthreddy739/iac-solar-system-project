#!/bin/bash

# setting up and enabling the metric api in eks
kubectl apply -f https://github.com/kubernetes-sigs/metrics-server/releases/latest/download/components.yaml

# creating the 'dev-ns' namespace
kubectl create ns dev-ns

# creating the 'prod-ns' namespace
kubectl create ns prod-ns

# adding helm repo i.e "ingress-nginx chart"
helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx
helm repo update

# installing 'dev-ingress' controller.
helm install dev-ingress ingress-nginx/ingress-nginx \
--namespace dev-ns --create-namespace \
--set controller.ingressClassResource.name=dev-nginx \
--set controller.ingressClassResource.enabled=true \
--set controller.ingressClassResource.default=false \
--set controller.extraArgs.ingress-class=dev-nginx

# installing 'prod-ingress' controller.
helm install prod-ingress ingress-nginx/ingress-nginx \
--namespace prod-ns --create-namespace \
--set controller.ingressClassResource.name=prod-nginx \
--set controller.ingressClassResource.enabled=true \
--set controller.ingressClassResource.default=false \
--set controller.extraArgs.ingress-class=prod-nginx

# setting up the stateful-set for the "mongo-db"
kubectl apply -f mongodb-statefulset/solar-system-db-service.yml
kubectl apply -f mongodb-statefulset/solar-system-db-stateful-set.yml

# setting up the kubernetes-dashboard
# adding the 'kubernetes-dashboard' helm repo
helm repo add kubernetes-dashboard https://kubernetes.github.io/dashboard/
helm repo update
# intalling the 'kubernetes-dashboard' helm repo in 'kubernetes-dashboard' name-space
helm upgrade --install kubernetes-dashboard kubernetes-dashboard/kubernetes-dashboard --create-namespace --namespace kubernetes-dashboard

# creating the 'admin' service accout and rbac for secure access of 'kubernetes-dashboard'
kubectl apply -f admin-service-account-rbac.yaml

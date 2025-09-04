#!/bin/bash

# kubectl setup
set -e
KUBECTL_VERSION=$(curl -L -s https://dl.k8s.io/release/stable.txt)
curl -LO "https://dl.k8s.io/release/${KUBECTL_VERSION}/bin/linux/amd64/kubectl"
chmod +x kubectl
sudo mv -f kubectl /usr/local/bin/


# helm setup
sudo wget https://get.helm.sh/helm-v3.18.6-linux-amd64.tar.gz
sudo tar -zxvf helm-v3.18.6-linux-amd64.tar.gz
sudo rm -f helm*
sudo mv -f linux-amd64/helm /usr/local/bin/helm
sudo rm -rf linux-amd64




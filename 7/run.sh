#!/bin/bash
set -e

kubectl create ns gitlab
kubectl --insecure-skip-tls-verify apply -f external-gitlab-svc.yml
helm repo add gitlab https://charts.gitlab.io
helm upgrade --install gitlab-runner gitlab/gitlab-runner -f gitlab-runner-helm-values.yml -n gitlab --kubeconfig=/home/kerem/kubeconfig.proxy --version 0.18.0

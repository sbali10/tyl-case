#!/bin/bash

kubectl create ns monitoring
kubectl label nodes node2 nodetype=server1
helm upgrade --install internal-prometheus stable/prometheus -f prometheus-helm-values.yml --set server.nodeSelector.nodetype=server1 --namespace monitoring

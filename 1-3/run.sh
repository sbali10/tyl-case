#!/bin/bash

kubectl --insecure-skip-tls-verify taint nodes node2 node=server1:NoSchedule

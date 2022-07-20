#!/bin/bash

ip=$(kubectl get ingress yages --template="{{range .status.loadBalancer.ingress}}{{.ip}}{{end}}")
while [ -z "$ip" ]; do
    echo "waiting ingress ip to be ready..."
    sleep 5
    ip=$(kubectl get ingress yages --template="{{range .status.loadBalancer.ingress}}{{.ip}}{{end}}")
done

echo "making the grpc request, response:"
grpcurl -insecure -proto yages-schema.proto -authority yages.example.com "$ip:443" yages.Echo.Ping

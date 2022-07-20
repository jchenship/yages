# Reproduce ingress-nginx grpc ingress service-upstream authority header issue

related to https://github.com/kubernetes/ingress-nginx/issues/8843

## How to use

**prerequisite**

- docker
- minikube
- helm
- go 1.18

**prepare**

run `./reproduce-prepare.sh` , this script will

- start minikube
- install ingress-nginx latest (without any values config)
- build a grpc server that will echo the `:authority` header and load the image to minikube
- create a tls secret (because grpc ingress needs to go over tls)
- apply ingress.yaml

**send grpc request**

run `./reproduce-request.sh`

if you see a response of

```
{
  "text": "upstream_balancer"
}
```

it means the `:authority` header received by the service is `upstream_balancer`

you can check the server code in `main.go`

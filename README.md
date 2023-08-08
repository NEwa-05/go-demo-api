# go-demo-api

## Build image

```bash
docker buildx build -t newa/demo-api:1.0 --platform linux/amd64 -f Dockerfile . --push
```

## Deploy in K8s

### Generate TLS certificate

```bash
bash gencert.sh gateway.domain.tld
```

### Create demo namespace

```bash
kubectl create ns demo
```

### Create TLS certificate Secret

``` bash
kubectl -n demo create secret tls api-demo-tls --key server.key --cert server.crt
```

### Test deployment

```bash
kubectl apply -f K8s/demo-api.yaml
```

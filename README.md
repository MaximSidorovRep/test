## Build image

```bash
docker build -t test_java .
```

## Run docker-compose

```bash
docker-compose up -d
```

## Check runing app

```bash
curl 0.0.0.0:8080/greeting

<!DOCTYPE HTML>
<html>
<head>
    <title>Getting Started: Serving Web Content</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
</head>
<body>
    <p >Hello, World!</p>
</body>

</html>

```

### Check prometheus
```bash
curl 0.0.0.0:9090/metrics
```

### Run helm chart
```bash

# Start minikube
minikube start

# Set docker env
eval $(minikube docker-env) 

# Build image for k8s
docker build -t test_java .

#install app
helm install testjava ./helm-app/

kubectl get nodes -o wide 
INTERNAL-IP->192.168.59.2


curl 192.168.59.2:30007/greeting


<!DOCTYPE HTML>
<html>
<head>
    <title>Getting Started: Serving Web Content</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
</head>
<body>
    <p >Hello, World!</p>
</body>
</html>

```



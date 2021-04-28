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



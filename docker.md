Control docker inside container


```
docker-compose -f docker.yml build && docker-compose -f docker.yml up -d && docker exec docker docker ps
```
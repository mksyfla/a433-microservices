# membuat docker image dengan nama image order-service yang memiliki tag latest
docker build -t ghcr.io/mksyfla/order-service:latest .

# melakukan login ke github container registry
echo $GCR_CREDENTIALS | docker login ghcr.io -u mksyfla --password-stdin

# melakukan push image ke github container registry
docker push ghcr.io/mksyfla/order-service:latest
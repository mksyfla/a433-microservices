# membuat docker image dengan nama  image berdasarkan format github container registry
docker build -t ghcr.io/mksyfla/karsajobs-ui:latest .

# login ke dalam github container registry
echo $GCR_CREDENTIALS | docker login ghcr.io -u mksyfla --password-stdin

# melakukan push image ke github container registry
docker push ghcr.io/mksyfla/karsajobs-ui:latest
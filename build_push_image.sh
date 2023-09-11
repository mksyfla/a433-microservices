# membuat docker image dengan nama image item-app yang memiliki tag v1
docker build -t item-app:v1 .

# melihat isi list dari images yang ada pada lokal
docker images

# mengubah nama image pada lokal ke nama image berdasarkan format github container registry
docker tag item-app:v1 ghcr.io/mksyfla/item-app:v1

# melakukan login ke github container registry
echo $GCR_CREDENTIALS | docker login ghcr.io -u mksyfla --password-stdin

# melakukan push image ke github container registry
docker push ghcr.io/mksyfla/item-app:v1
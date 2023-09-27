# menggunakan node:16 versi alpine sebagai base
FROM node:16-alpine

# memilih working directory di container
WORKDIR /app

# menyalin dari source code ke working directory
COPY . /app

# mengistall bash di container
RUN apk add --no-cache bash

# mengunduh wait-for-it.sh
RUN wget -O /bin/wait-for-it.sh https://raw.githubusercontent.com/vishnubob/wait-for-it/master/wait-for-it.sh

# membuat file menjadi executable
RUN chmod +x /bin/wait-for-it.sh

# memasang dependencies yang dibutuhkan pada aplikasi
RUN npm install

# menyalin file javascript ke ./
COPY ./*.js ./

# menjalankan command node index.js
CMD ["node", "index.js"]
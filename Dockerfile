# menggunakan node:14 versi alpine
FROM node:14-alpine

# menetapkan working directory
WORKDIR /app

# menyalin file yang memiliki nama berawalan package ke ./
COPY . /app

# meninstall bash di dalam container
RUN apk add --no-cache bash

# mengundah file bash dari link dibawah
RUN wget -O /bin/wait-for-it.sh https://raw.githubusercontent.com/vishnubob/wait-for-it/master/wait-for-it.sh

# mengubah akses agar bisa di eksekusi
RUN chmod +x /bin/wait-for-it.sh

# menginstall dependensi yang dibutuhkan
RUN npm install

# mengekspos port
EXPOSE 3000

# menjalankan aplikasi
CMD ["npm", "start"]
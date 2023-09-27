# menggunakan node:18 versi alpine sebagai base
FROM node:18-alpine as base

# menetapkan working directory
WORKDIR /src

# menyalin sc ke container
COPY . .

# meninstall bash di dalam container
RUN apk add --no-cache bash

# mengundah file bash dari link dibawah
RUN wget -O /bin/wait-for-it.sh https://raw.githubusercontent.com/vishnubob/wait-for-it/master/wait-for-it.sh

# mengubah akses agar bisa di eksekusi
RUN chmod +x /bin/wait-for-it.sh

# memasang dependensi yang dibutuhkan
RUN npm install

# mengekspos port
EXPOSE 3001

# menjalankan aplikasi
CMD ["npm", "start"]
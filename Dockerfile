# menggunakan node:18 versi alpine sebagai base
FROM node:18-alpine as base

# menetapkan working directory
WORKDIR /src

# menyalin file yang memiliki nama berawalan package ke ./
COPY package*.json ./


# menggunakan base sebagai production
FROM base as production

# menentukan environment aplikasi
ENV NODE_ENV=production

# menginstall dependensi yang dibutuhkan
RUN npm ci

# menyalin file yang memiliki format js ke ./
COPY ./*.js ./

# menjalankan aplikasi
CMD ["npm", "start"]


# menggunakan base sebagai dev
FROM base as dev

# meninstall bash di dalam container
RUN apk add --no-cache bash

# mengundah file bash dari link dibawah
RUN wget -O /bin/wait-for-it.sh https://raw.githubusercontent.com/vishnubob/wait-for-it/master/wait-for-it.sh

# mengubah akses agar bisa di eksekusi
RUN chmod +x /bin/wait-for-it.sh

# menginstall dependensi yang dibutuhkan
ENV NODE_ENV=development

# menginstall dependensi yang dibutuhkan
RUN npm install

# menyalin file yang memiliki format js ke ./
COPY ./*.js ./

# mengekspos port
EXPOSE 3000

# menjalankan aplikasi
CMD ["npm", "start"]
# menggunakan node:14 versi alpine sebagai base
FROM node:14-alpine

# memilih working directory di container
WORKDIR /app

# menyalin dari source code ke working directory
COPY . /app

# mengonfigurasi environment pada container
ENV PORT=3001

# memasang dependencies yang dibutuhkan pada aplikasi
RUN npm install

# mengekspos port container sehingga dapat berjalan pada port 3001
EXPOSE 3001

# menjalankan command nodejs
CMD ["npm", "start"]
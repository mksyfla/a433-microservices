# menggunakan node:14-alpine sebagai base image pada container 
FROM node:14-alpine

# memilih working directory di container
WORKDIR /app

# menyalin dari source code ke working directory
COPY . /app

# mengonfigurasi environment pada container
ENV NODE_ENV=production DB_HOST=item-db

# memasang dependensi serta menbuild aplikasi dalam container
RUN npm install --production --unsafe-perm && npm run build

# mengekspos port container sehingga dapat berjalan pada port 8080
EXPOSE 8080

# ketika container dijalankan akan melakukan command di bawah
CMD ["npm", "start"]
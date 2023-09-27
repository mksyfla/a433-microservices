# menggunakan node:14-alpine sebagai base image pada container 
FROM node:14-alpine

# memilih working directory di container
WORKDIR /app

# menyalin dari source code ke working directory
COPY . /app

# memasang dependensi serta menbuild aplikasi dalam container
RUN npm install

# mengekspos port container sehingga dapat berjalan pada port 3000
EXPOSE 3000

# ketika container dijalankan akan melakukan command di bawah
CMD ["npm", "start"]
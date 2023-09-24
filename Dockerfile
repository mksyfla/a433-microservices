# menggunakan node:18 versi alpine sebagai base
FROM node:18-alpine as base

# menggunakan /src ebagai working directory
WORKDIR /src

# menyalin file json dengan awalan "package" ke ./
COPY package*.json ./


# menggunakan base sebagai production
FROM base as production

# menentukan environment dengan NODE_ENV = production
ENV NODE_ENV=production

# memasang dependencies yang dibutuhkan pada aplikasi
RUN npm ci

# menyalin file javascript ke ./
COPY ./*.js ./

# menjalankan command node index.js
CMD ["node", "index.js"]


# menggunakan base sebagai dev
FROM base as dev

# mengistall bash di container
RUN apk add --no-cache bash

# mengunduh wait-for-it.sh
RUN wget -O /bin/wait-for-it.sh https://raw.githubusercontent.com/vishnubob/wait-for-it/master/wait-for-it.sh

# membuat file menjadi executable
RUN chmod +x /bin/wait-for-it.sh

# menentukan environment dengan NODE_ENV = development
ENV NODE_ENV=development

# memasang dependencies yang dibutuhkan pada aplikasi
RUN npm install

# menyalin file javascript ke ./
COPY ./*.js ./

# menjalankan command node index.js
CMD ["node", "index.js"]
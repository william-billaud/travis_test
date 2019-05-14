FROM node:8-alpine

WORKDIR /usr/src/app

COPY package*.json ./
RUN npm install
EXPOSE  8081
COPY  index.js ./
CMD ["npm","start"]

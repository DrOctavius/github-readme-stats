# syntax=docker/dockerfile:1

FROM node:21

WORKDIR /app
COPY . /app
RUN npm install
CMD ["node","express.js"]
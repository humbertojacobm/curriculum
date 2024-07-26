FROM node:20-alpine AS build
RUN apk add --no-cache  chromium --repository=http://dl-cdn.alpinelinux.org/alpine/v3.10/main
COPY package.json package-lock.json ./
RUN npm install

FROM build
COPY index.js ./
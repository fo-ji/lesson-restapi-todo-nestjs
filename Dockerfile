FROM node:18.12.0-slim

WORKDIR /server

RUN npm i -g @nestjs/cli

FROM node:16-alpine as builder
#Install some depemdencies
#COPY package.json ./
#WORKDIR /app
WORKDIR /home/node/app
#So here we can use both type of workdir  like /home or only /home/node/app
     
COPY package.json ./
RUN npm install
COPY ./ ./
#Default command
RUN npm run build

FROM nginx
COPY --from=builder /home/node/app/build /usr/share/nginx/html
#depend on workdir we need to change  the copy folder directory if we use only /app than it'll be /app/build
#if we use /home/node/app as build directory than we need to use /home/node/app/build  from where we can copy build directory
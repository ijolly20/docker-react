FROM node:alpine as builder 
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . . 
RUN npm run build

# Note from statement terminates previous block in Dockerfile
FROM nginx
COPY --from=0 /app/build /usr/share/nginx/html
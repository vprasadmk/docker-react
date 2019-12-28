#BUILD PHASE and tagging it as builder

FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# the above commands installs the npm in the base image and builds it into /app/build folder

#RUN PHASE
FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html
#NO need to specify commad to start nginx, because it does it by default 
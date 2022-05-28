##<-- BUILD PHASE -->##
FROM node:alpine as builder

WORKDIR '/app'

COPY package.json .

RUN npm install 

COPY . . 

RUN npm run build


##<-- RUN PHASE -->##

FROM nginx:stable

#    for the server#

EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html


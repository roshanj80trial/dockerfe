# Phase 1 - Application build
FROM alpine

RUN apk add --update nodejs npm

WORKDIR /usr/dockerfe

COPY ./package.json .
RUN npm install

COPY . .
RUN npm run build

# Phase 2 - Copy the build folder to nginx serve
FROM nginx
COPY --from=0 /usr/dockerfe/build /usr/share/nginx/html
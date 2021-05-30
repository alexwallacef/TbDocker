FROM nginx:alpine
RUN apk update && apk add mysql-client
EXPOSE 80
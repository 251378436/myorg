FROM nginx:alpine
COPY ./dist/apps/api ./usr/share/nginx/html
COPY ./default_api.conf /etc/nginx/api_conf.d/default_api.conf
COPY ./api_gateway.conf /etc/nginx/api_gateway.conf
COPY ./nginx.webapi.conf /etc/nginx/nginx.conf
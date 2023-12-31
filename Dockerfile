FROM openresty/openresty:xenial

# install dependencies
RUN ["luarocks", "install", "lua-resty-session"]
RUN ["luarocks", "install", "lua-resty-openidc"]
RUN ["luarocks", "install", "lua-resty-http"]
RUN ["luarocks", "install", "lua-resty-jwt"]

COPY conf/nginx_local.conf /usr/local/openresty/nginx/conf/nginx.conf
# COPY conf/nginx_api.conf /dnginx_api.conf
COPY conf/authz_local.conf /usr/local/openresty/nginx/conf/authz.conf

CMD ["nginx", "-g", "daemon off;"]

EXPOSE 80

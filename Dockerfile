FROM openresty/openresty:xenial

# install dependencies
RUN ["luarocks", "install", "lua-resty-session"]
RUN ["luarocks", "install", "lua-resty-http"]
RUN ["luarocks", "install", "lua-resty-jwt"]

ADD lib/resty/openidc.lua /usr/local/openresty/lualib/resty/openidc.lua
ADD lib/resty/parseUri.lua /usr/local/openresty/lualib/resty/parseUri.lua
COPY conf/nginx.conf /usr/local/openresty/nginx/conf/nginx.conf
COPY conf/nginx_api.conf /usr/local/openresty/nginx/conf/nginx_api.conf
COPY conf/authz.conf /usr/local/openresty/nginx/conf/authz.conf
COPY conf/authz_api.conf /usr/local/openresty/nginx/conf/authz_api.conf

CMD ["nginx", "-g", "daemon off;"]

EXPOSE 80

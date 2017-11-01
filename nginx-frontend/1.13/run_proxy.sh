#!/bin/bash

#
# run_proxy.sh - nginx-simple-proxy
#

cat /etc/nginx/nginx.conf.in | envsubst '\
    ${BACKEND_PORT} \
    ${FRONTEND_PORT}' > /etc/nginx/nginx.conf

exec nginx -g "daemon off;"

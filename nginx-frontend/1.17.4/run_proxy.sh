#!/bin/bash

#
# run_proxy.sh - nginx-simple-proxy
#

if [ "$HTTPS_REDIRECT" = true ]; then
    cat /etc/nginx/nginx.redirect.conf.in | envsubst '\
        ${BACKEND_PORT} \
        ${FRONTEND_PORT}' > /etc/nginx/nginx.conf
else
    cat /etc/nginx/nginx.conf.in | envsubst '\
        ${BACKEND_PORT} \
        ${FRONTEND_PORT}' > /etc/nginx/nginx.conf
fi

exec nginx -g "daemon off;"

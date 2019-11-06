#
# Dockerfile - nginx-simple-proxy
#

FROM library/nginx:1.17.4

ENV HTTPS_REDIRECT false

ADD nginx.conf.in /etc/nginx/nginx.conf.in
ADD nginx.redirect.conf.in /etc/nginx/nginx.redirect.conf.in
ADD run_proxy.sh /run_proxy.sh

RUN chown root:root /run_proxy.sh
RUN chmod 755 /run_proxy.sh

CMD ["/run_proxy"]

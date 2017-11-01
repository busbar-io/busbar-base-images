#
# Dockerfile - nginx-simple-proxy
#

FROM library/nginx:1.13

ADD nginx.conf.in /etc/nginx/nginx.conf.in
ADD run_proxy.sh /run_proxy.sh

RUN chown root:root /run_proxy.sh
RUN chmod 755 /run_proxy.sh

CMD ["/run_proxy"]

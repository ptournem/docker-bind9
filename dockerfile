FROM ubuntu:bionic

RUN apt-get update \
  && apt-get install -y \
  bind9 \
  bind9utils \
  bind9-doc

EXPOSE 53/udp
EXPOSE 53/tcp

# Enable IPv4
RUN sed -i 's/OPTIONS=.*/OPTIONS="-4 -u bind"/' /etc/default/bind9

# Copy configuration files
COPY config/named.conf.options /etc/bind/
COPY config/named.conf.local /etc/bind/
COPY config/zones/* /etc/bind/zones/

# start bind 9
#CMD ["/etc/init.d/bind9", "start"] 
CMD /etc/init.d/bind9  start && tail -F /var/log/bind9.log

# Run eternal loop
#CMD ["/bin/bash", "-c", "while :; do sleep 10; done"]
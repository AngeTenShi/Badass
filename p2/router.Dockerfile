FROM frrouting/frr

RUN apk add iproute2 vim

RUN sed -i 's/bgpd=no/bgpd=yes/' /etc/frr/daemons && \
    sed -i 's/ospfd=no/ospfd=yes/' /etc/frr/daemons && \
    sed -i 's/isisd=no/isisd=yes/' /etc/frr/daemons && \
    echo 'zebra=yes' >> /etc/frr/daemons
    

COPY   scripts/router.sh /init.sh
RUN    touch /etc/frr/vtysh.conf

SHELL ["/bin/busybox", "ash", "-c"]

CMD /usr/lib/frr/frrinit.sh start && tail -f /dev/null
    

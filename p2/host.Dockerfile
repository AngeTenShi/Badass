FROM gns3/endhost

RUN apk add iproute2

COPY scripts/host.sh /init.sh

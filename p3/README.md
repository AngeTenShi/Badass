First of all run exec_docker.sh

Then go on gns3 and open the project then run the 4 routers in the following order (not mandatory):
- achansel-2
- achansel-1
- achansel-3
- achansel-4

then you can boot the hosts

and for testing you can
ip addr add 20.1.1.1/24 dev eth1 (host_achansel-1)
ip addr add 20.1.1.2/24 dev eth0 (host_achansel-2)
ip addr add 20.1.1.3/24 dev eth0 (host_achansel-3)
and try to ping

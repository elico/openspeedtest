/interface/bridge/add name=dockers
/ip/address/add address=172.17.0.254/24 interface=dockers

/interface/veth/add name=veth2 address=172.17.0.2/24 gateway=172.17.0.254
/interface/bridge/port add bridge=dockers interface=veth2

/container/config/set registry-url=https://registry-1.docker.io tmpdir=disk1/pull

/container/envs/add name=speedtest_envs key=TZ value="Asia/Jerusalem"
/container/mount add dst=/var/log/nginx name=openspeed src=/disk1/openspeed/var
/container/add dns=172.17.0.254 remote-image=elicro/openspeedtest:latest interface=veth2 root-dir=disk1/speedtest envlist=speedtest_envs start-on-boot=yes

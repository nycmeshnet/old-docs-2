Need confs in /etc/tinc/nycmesh

Host public keys go in /etc/tinc/nycmesh/hosts


mkdir /etc/tinc/nycmesh

mkdir /etc/tinc/nycmesh/hosts

edit 'name' in /etc/tinc/nycmesh/tinc.conf 

Generate key by:

tincd -n nycmesh -K4096

tinc uses port 655 udp or tcp by default

Note: It appears you need to set /rateMax and /rateMin for bmx6 or the mesh link drops 

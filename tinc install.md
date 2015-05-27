ssh into router and-
```
opkg update
opkg install tinc
```

After install, you need to make the "nycmesh" and "hosts" directories
```
mkdir -p /etc/tinc/nycmesh/hosts
```

On your computer
```
git clone https://github.com/nycmeshnet/docs
cd "docs/tinc"
scp tinc-up root@10.x.x.1:/etc/tinc/nycmesh/tinc-up
scp tinc.conf root@10.x.x.1:/etc/tinc/nycmesh/tinc.conf
cd hosts
scp hostName root@10.x.x.1:/etc/tinc/nycmesh/hosts/hostName
scp hostName2 root@10.x.x.1:/etc/tinc/nycmesh/hosts/hostName2
```

 -ssh into router, make tinc-up executable
```
cd /etc/tinc/nycmesh
chmod +x tinc-up
```
 -edit tinc.conf Name and ConnectTo
```
vi tinc.conf
```
e.g.
```
Name = MyNewNodeName
AddressFamily = any
Interface = tap0
Mode = switch
ConnectTo = BkBayRidge
```

Copy the new public key for this node to your computer
```
scp root@10.x.x.1:/etc/tinc/nycmesh/hosts/MyNewNodeName MyNewNodeName
```

The file MyNewNodeName has to also be copied to the "hosts" folder of the routers that you are tunneling to

MTU 1300 must be set in advanced bmx6 options. This can be done in the luci interface-
Mesh>Configuration>tunMtu 1300






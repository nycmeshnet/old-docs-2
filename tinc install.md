
ssh in and-
```
opkg update
opkg install tinc
```

after install, you also need to make the "nycmesh" and "hosts" directories
```mkdir -p /etc/tinc/nycmesh/hosts```

on your computer, clone https://github.com/nycmeshnet/docs
in terminal, move to folder "tinc"
```
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
Name = MyNewNodeName
AddressFamily = any
Interface = tap0
Mode = switch
ConnectTo = BkBayRidge

copy the new public key for this node to your computer
```
scp root@10.30.82.1:/etc/tinc/nycmesh/hosts/MyNewNodeName MyNewNodeName
```

The file MyNewNodeName has to also be copied to the "hosts" folder of the routers that you are tunneling to

MTU 1300 must be set in advanced bmx6 options. This can be done in the luci interface-
Mesh>Configuration>tunMtu 1300


Add the following line to the startup script. This can be done by editing /etc/rc.local or in luci>Administration>System>Startup>Local Startup. Make sure "exit 0" is the last line.
```
tincd -n nycmesh
```
you can also use the same line to start the tunnel without rebooting

if opkg doesn't work you need to use full pathnames, e.g. for ar71xx-

```
cd /tmp
wget http://downloads.openwrt.org/chaos_calmer/15.05-rc1/ar71xx/generic/packages/base/zlib_1.2.8-1_ar71xx.ipk
wget http://downloads.openwrt.org/chaos_calmer/15.05-rc1/ar71xx/generic/packages/base/liblzo_2.08-1_ar71xx.ipk
wget http://downloads.openwrt.org/chaos_calmer/15.05-rc1/ar71xx/generic/packages/base/libopenssl_1.0.2a-0_ar71xx.ipk
wget http://downloads.openwrt.org/chaos_calmer/15.05-rc1/ar71xx/generic/packages/packages/tinc_1.0.25-1_ar71xx.ipk
opkg install zlib_1.2.8-1_ar71xx.ipk 
opkg install liblzo_2.08-1_ar71xx.ipk
opkg install libopenssl_1.0.2a-0_ar71xx.ipk
opkg install tinc_1.0.25-1_ar71xx.ipk
```





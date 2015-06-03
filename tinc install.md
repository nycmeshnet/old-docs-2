ssh into router and-
```
opkg update
opkg install tinc
```

After install, you need to make the "nycmesh" directory
```
mkdir /etc/tinc/nycmesh
```

On your computer
```
git clone https://github.com/nycmeshnet/docs
cd docs/tinc
scp tinc-up root@10.x.x.1:/etc/tinc/nycmesh/tinc-up
scp tinc.conf root@10.x.x.1:/etc/tinc/nycmesh/tinc.conf
scp -r hosts root@10.x.x.1:/etc/tinc/nycmesh/
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
MyNewNodeName can only contain letters and numbers e.g. MnEV3rdSt1, BkBayRidge3rdAve2, MnEVDBA1. Our format is borough-neighborhood-street/venue-number at this location.

Generate key by:
```
tincd -n nycmesh -K4096
```
Copy the new public key for this node to your computer
```
scp root@10.x.x.1:/etc/tinc/nycmesh/hosts/MyNewNodeName MyNewNodeName
```
The following line must be placed as the first line in the "ConnectTo" public key file (BkBayRidge, in this example). Please ask us for the actual address.
```
Address = 10.x.x.1
-----BEGIN RSA PUBLIC KEY-----
```

The file MyNewNodeName must also be copied to the "hosts" folder of a router that you are tunneling to. Ask us for help with this.

MTU 1300 must be set in advanced bmx6 options. This can be done in the luci interface-
Mesh>Configuration>tunMtu 1300

Add the following line to the startup script. This can be done by editing /etc/rc.local or in luci>Administration>System>Startup>Local Startup. Make sure "exit 0" is the last line.

```
tincd -n nycmesh
```
you can also use the same line to start the tunnel without rebooting







#!/bin/sh

#rev 0

ip=10.20.100.1
mask=255.255.255.0
cidrmask=24
devname=nycmesh
node=$(uci get qmp.node.community_node_id)
hostname="$devname-$node"

uci set qmp.roaming.ignore=1
uci set qmp.networks.disable_lan_dhcp=0
uci set qmp.networks.lan_address="$ip"
uci set qmp.networks.lan_netmask="$mask"
uci set qmp.networks.bmx6_ipv4_address="$ip/$cidrmask"
uci set qmp.node.community_id="$devname"
uci set system.@system[0].hostname="$hostname"

uci set wireless.wlan0ap.ssid="$devname $node"
uci set qmp.@wireless[0].channel=6
uci set wireless.radio0.channel=6
uci set qmp.@wireless[0].txpower=30
uci set wireless.radio0.txpower=30

uci commit


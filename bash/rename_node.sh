devname="Borough-Neighborhood-St-Install"
nodeid=$(uci get qmp.node.community_node_id)
uci set qmp.node.community_id="$devname"
uci set system.@system[0].hostname="$devname-$nodeid"
echo $devname-$nodeid > /proc/sys/kernel/hostname
/etc/init.d/bmx6 restart
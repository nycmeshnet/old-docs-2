## ssh into an active node to get mesh info

#print node info
bmx6 -c --originators

# print name and ipv6 (column 1 & 3) of lines containing "fd66" (ipv6 address)
bmx6 -c --originators | grep fd66 | awk '{print $1"\t"$3}'

# print node names (column 1)
bmx6 -c --originators | grep fd66 | awk '{print $1}'

# print number of nodes
bmx6 -c --originators | grep fd66 | wc -l


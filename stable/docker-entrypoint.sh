#!/bin/bash
#Make our scrip a little bit safer
set -eo pipefail

# if command starts with an option, prepend sems
if [ "${1:0:1}" = '-' ]; then
	set -- sems "$@"
fi

sed -ie "s/sip_ip=eth0/sip_ip=$INTERNAL_IP/g" /etc/sems/sems.conf
sed -ie "s/media_ip=eth0/media_ip=$INTERNAL_IP/g" /etc/sems/sems.conf
sed -ie "s/public_ip=eth0/public_ip=$PUBLIC_IP/g" /etc/sems/sems.conf
sed -ie "s/sip_port=5061/sip_port=$SIP_PORT/g" /etc/sems/sems.conf
sed -ie "s/node_id = 1/node_id = $NODE_ID/g" /etc/sems/etc/yeti.conf
sed -ie "s/127.0.0.1/$MANAGEMENT_ADDR/g" /etc/sems/etc/yeti.conf

echo "SEMS preparation is done!"

exec "$@"

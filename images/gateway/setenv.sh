#!/bin/sh
echo CONFIG_MODE : $CONFIG_MODE
echo BACK_END_NODE : $BACKEND_NODE
if [ ! -z $CONFIG_MODE ] && [ ! -z $BACKEND_NODE ] 
then
        case $CONFIG_MODE in
        	consul|etcd);; 
		*) exit ;;
	esac
	if [ ! -z $PREFIX ]
	then
       		/opt/confd/bin/confd -onetime -backend $CONFIG_MODE -node $BACKEND_NODE -prefix="$PREFIX" -log-level="debug" 
	else
       		/opt/confd/bin/confd -onetime -backend $CONFIG_MODE -node $BACKEND_NODE -log-level="debug" 
	fi
fi


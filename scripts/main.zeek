##! Add VLAN to all logs with an "id" field.

module Corelight;

redef record conn_id += {
	## The VLAN that the connection is seen on.
	vlan:       int &log &optional;

	## The inner VLAN tag for stacked VLAN tags.
	vlan_inner: int &log &optional;
};

event new_connection(c: connection) &priority=4
	{
	if ( c?$vlan )
		c$id$vlan = c$vlan;

	if ( c?$inner_vlan )
		c$id$vlan_inner = c$inner_vlan;
	}

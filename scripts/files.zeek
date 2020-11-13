
redef record Files::Info += {
	vlan       : int &log &optional;
	vlan_inner : int &log &optional;
};

event file_sniff(f: fa_file, meta: fa_metadata)
	{
	for ( cid, c in f$conns )
		{
		if ( c?$vlan )
			f$info$vlan = c$vlan;
		if ( c?$inner_vlan )
			f$info$vlan_inner = c$inner_vlan;
		# just grab the first one
		break;
		}
	}


redef record Files::Info += {
	vlan       : int &log &optional;
	vlan_inner : int &log &optional;
};

event file_sniff(f: fa_file, meta: fa_metadata)
	{
	for ( id in f$conns )
		{
		if ( id?$vlan )
			f$info$vlan = id$vlan;
		if ( id?$vlan_inner )
			f$info$vlan_inner = id$vlan_inner;
		# just grab the first one
		break;
		}
	}

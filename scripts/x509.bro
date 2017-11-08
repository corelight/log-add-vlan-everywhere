
redef record X509::Info += {
	vlan       : int &log &optional;
	vlan_inner : int &log &optional;
};

event x509_certificate(f: fa_file, cert_ref: opaque of x509, cert: X509::Certificate)
	{
	for ( id in f$conns )
		{
		if ( id?$vlan )
			f$info$x509$vlan = id$vlan;
		if ( id?$vlan_inner )
			f$info$x509$vlan_inner = id$vlan_inner;
		# just grab the first one
		break;
		}
	}

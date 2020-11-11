
redef record X509::Info += {
	vlan       : int &log &optional;
	vlan_inner : int &log &optional;
};

event x509_certificate(f: fa_file, cert_ref: opaque of x509, cert: X509::Certificate)
	{
	for ( cid, c in f$conns )
                {
                if ( c?$vlan )
                        f$info$x509$vlan = c$vlan;
                if ( c?$inner_vlan )
                        f$info$x509$vlan_inner = c$inner_vlan;
		# just grab the first one
		break;
		}
	}

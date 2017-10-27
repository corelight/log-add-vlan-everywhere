Add VLAN tags to all Bro logs
-----------------------------

This script adds VLAN tags to all of the Bro logs that have the ``conn_id``
(``id``) field.

Installation
------------

::

  bro-pkg refresh
  bro-pkg install corelight/log-add-vlan-everywhere

Usage
-----

All Bro logs that contain connection information with the ``c$id`` field 
should have fields that indicate VLAN tags (named ``vlan`` and ``inner_vlan``).

Potential Side Effects
----------------------

There are potential side effects from loading this script if another script
is indexing tables based on the ``c$id`` field.  This generally is not done
in most modern scripts and is not done in the core Bro distribution anywhere.

This script tries to avoid potential trouble with this indexing issue by 
only grabbing the VLAN information from the  ``connection_established`` 
event because any other script that uses ``c$id`` for indexing would probably
always get the value that was collected already anyway.

If you think that this script is impacting any other script please reach out 
to us at support@corelight.com and let us know what script you think it might
be impacting.

Authors
-------

Nate Guagenti @neu5ron
Seth Hall <seth@corelight.com>

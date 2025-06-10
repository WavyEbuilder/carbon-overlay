==============
Carbon Overlay
==============

Gentoo Linux overlay.

Quick Start
-----------

.. code-block:: bash

   mkdir -p /etc/portage/repos.conf

   cat << EOF > /etc/portage/repos.conf/carbon.conf
   [carbon]
   location = /var/db/repos/carbon
   sync-type = git
   sync-uri = https://github.com/WavyEbuilder/carbon-overlay.git
   EOF

   emaint sync -r carbon

Licence
-------

Carbon overlay is licensed under the GNU GPL2. A copy of the licence text can be found in `COPYING <COPYING>`_.

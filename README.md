This cookbook installs and configures Hortonworks SmartSense standalone.

TODO
====

1. Use jdk cookbook https://github.com/agileorbit-cookbooks/java/blob/master/.kitchen.yml
2. Use template file for hst-server.ini
3. Separate cookbook for hst and hst agent 
5. Do I need a gateway?
6. Need SSL certificate
7. Replace hard-coded smartsense*.deb file with URL of the local repo, good for now as it does not require internet connection but for deployment, need to replace with remote_file
8. Make recipes indempotant!
10. TestKitchen
11. make sure requirements are met by SmartSense package and not included in chef recipe.

Requirements
============

Please see [latested documentation](http://docs.hortonworks.com/HDPDocuments/SS1/SmartSense-1.2.2/bk_smartsense_admin/content/os_requirements.html).

Usage
=====

Add `smartsense` to your node's `run_list`.

Testing
=======

A `.kitchen.yaml` file is provided. Run `kitchen converge` to verify this cookbook.

# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

    config.vm.box = "scotch/box"
    config.vm.network "private_network", ip: "192.168.33.10"
    config.vm.hostname = "scotchbox"
		# saiena - WE DON'T NEED THE DEFAULT MOUNT POINT
    	# config.vm.synced_folder ".", "/var/www", :mount_options => ["dmode=777", "fmode=666"]

	# NMD SETUP - MOUNT POINTS
		# mount nmd_on_scotchbox directory for provisioning purposes
		  config.vm.synced_folder ".", "/var/www/nmd_on_scotchbox", :mount_options => ["dmode=777", "fmode=666"]
		# mount directory containing nmd websites
		  config.vm.synced_folder "~/Documents/htdocs/nmd_websites", "/var/www/nmd_websites", :mount_options => ["dmode=777", "fmode=666"]

	# NMD SETUP - PROVISIONING
		# Run shell script to complete NMD provisioning
		  config.vm.provision :shell, :path => "nmd_provisioning/nmd_vagrant_provisioning_apache.sh"
		  config.vm.provision :shell, :path => "nmd_provisioning/nmd_vagrant_provisioning_database.sh"
		  config.vm.provision :shell, :path => "nmd_provisioning/nmd_vagrant_provisioning_extras.sh"
end
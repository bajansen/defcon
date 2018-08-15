# -*- mode: ruby -*-
# vi: set ft=ruby :

require 'yaml'

# the os name is the name for the vagrant box as well as for the subdirectory containing scripts and playbooks
platforms = YAML.load_file(File.join(File.dirname(__FILE__), 'platforms.yml'))

application = ARGV[0][2..ARGV[0].length]

Vagrant.configure("2") do |config|

	# spin up testrunner and management vm
	config.vm.define "testrunner" do |testrunner|
		testrunner.vm.box = "debian/stretch64"
		testrunner.vm.synced_folder "ansible/testrunner/files", "/vagrant", disabled: false
		testrunner.vm.network "private_network", ip: "192.168.130.1", virtualbox__intnet: "testnet"
		testrunner.vm.provision :ansible do |ansible|
			ansible.playbook = "ansible/testrunner/playbook.yml"
		end
	end

	platforms.each do |platform|
		config.vm.define platform['name'] do |os|
			os.vm.box = platform['box']
			os.vm.network "private_network", type: "dhcp", virtualbox__intnet: "testnet"
			os.vm.hostname = platform['name']
			os.vm.synced_folder ".", "/vagrant", disabled: true
			if File.file?("ansible/#{platform['ansible_path']}/#{application}.yml")
				os.vm.provision :ansible do |ansible|
					ansible.playbook = "ansible/#{platform['ansible_path']}/#{application}.yml"
				end
			end
			if platform['shell']
				os.ssh.shell = platform['shell']
			end
			if platform['base_mac']
				os.vm.base_mac = platform['base_mac']
			end
		end
	end
end

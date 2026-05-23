# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|
  # Base
  config.vm.define "rtcbook-D1a", primary: true do |dist|
    dist.vm.box = "drrico/rtcbook-D1a" # remote
  end
  config.vm.define "test", autostart: false , primary: false do |test|
    test.vm.box = "../dist/rtcbook-D1a.box"
  end

  # Set architecture
  config.vm.box_architecture = "amd64"

  # Shared folder
  config.vm.synced_folder ".", 'C:\vagrant', automount: true

  # Customization
  config.vm.communicator = "winrm"

  config.vm.provider "virtualbox" do |v|
    v.linked_clone = false # for fast
    v.check_guest_additions = false # production skip
    v.name = "rtcbook-D1a"    # Sets the new VM's name
    v.gui = true        # Enables the hypervisor's GUI
    v.memory = 4096     # Sets the VM's RAM
    v.cpus = 4
    v.customize ["modifyvm", :id, "--vram", "128"] # especially with the higher res we allow now (64 MB default)
    v.customize ["modifyvm", :id, "--usbxhci", "on"] # Enables usb 2.0 controller
    v.customize ["modifyvm", :id, "--draganddrop", "bidirectional"] # Enables drag-and-drop between host and guest
    v.customize ["modifyvm", :id, "--clipboard", "bidirectional"] # Enables a bidirectional clipboard between host and guest
    v.customize ["storageattach", :id, "--storagectl", "IDE Controller", "--port", "0", "--device", "0", "--type", "dvddrive", "--medium", "emptydrive"]
    v.customize ["usbfilter", "add", "0", "--target", :id, "--name", "National Instruments", "--vendorid", "3923"]
    v.customize ["setextradata", :id, "GUI/MaxGuestResolution", "any"]
    v.customize ["setextradata", :id, "GUI/ScaleFactor", "1"] # will change scaling in guest for nice resolution
  end
end

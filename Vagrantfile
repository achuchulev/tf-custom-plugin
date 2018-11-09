Vagrant.configure("2") do |config|
  config.vm.box = "achuchulev/xenial64"
  config.vm.provision "shell", path: "scripts/provision.sh"
  config.vm.synced_folder ".", "/vagrant", disabled: false
end

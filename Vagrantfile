Vagrant.configure("2") do |config|

  config.vm.box = "jhcook/macos-sierra"
  config.vm.hostname = "testy-daboot"

  MEMORY = ENV['VM_MEMORY'] || 4096

  config.vm.synced_folder "..", "/reach", type: "nfs"
  config.vm.network "private_network", ip: "172.20.20.10"

  config.vm.provider :virtualbox do |vb, override|
    vb.customize ["modifyvm", :id, "--memory", MEMORY.to_s]
    vb.gui = true
  end

end

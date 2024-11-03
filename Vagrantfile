Vagrant.configure("2") do |config|
  # config.trigger.before :provisioner_run, type: :hook do |t|
  #   t.info = "Before the provision!"
  #   t.run = {inline: "bash -c 'echo \"hey there!!\" > file.txt'"}
  # end

  # config.trigger.after :up do |trigger|
  #   # trigger.action = :provision
  #   trigger.info = "More information"
  # end
  config.vm.define "control-plane-node-1" do |vm|
    vm.vm.provider :libvirt do |domain|
      domain.cpus = 2
      domain.memory = 2048
      # domain.serial :type => "file", :source => {:path => "/tmp/control-plane-node-1.log"}
      domain.storage :file, :device => :cdrom, :path => "/tmp/metal-amd64.iso"
      domain.storage :file, :size => '4G', :type => 'raw'
      domain.boot 'hd'
      domain.boot 'cdrom'
    end
    vm.trigger.after :up do |trigger|
      trigger.info = "More information with ruby magic"
      trigger.ruby do |env,machine|
        # puts `echo #{machine}`
        # puts env.to_yaml
        puts machine.to_yaml
      end
    end
  end

  config.vm.define "control-plane-node-2" do |vm|
    vm.vm.provider :libvirt do |domain|
      domain.cpus = 2
      domain.memory = 2048
      # domain.serial :type => "file", :source => {:path => "/tmp/control-plane-node-2.log"}
      domain.storage :file, :device => :cdrom, :path => "/tmp/metal-amd64.iso"
      domain.storage :file, :size => '4G', :type => 'raw'
      domain.boot 'hd'
      domain.boot 'cdrom'
    end
  end

  config.vm.define "control-plane-node-3" do |vm|
    vm.vm.provider :libvirt do |domain|
      domain.cpus = 2
      domain.memory = 2048
      # domain.serial :type => "file", :source => {:path => "/tmp/control-plane-node-3.log"}
      domain.storage :file, :device => :cdrom, :path => "/tmp/metal-amd64.iso"
      domain.storage :file, :size => '4G', :type => 'raw'
      domain.boot 'hd'
      domain.boot 'cdrom'
    end
  end
  config.vm.define "worker-node-1" do |vm|
    vm.vm.provider :libvirt do |domain|
      domain.cpus = 1
      domain.memory = 1024
      # domain.serial :type => "file", :source => {:path => "/tmp/worker-node-1.log"}
      domain.storage :file, :device => :cdrom, :path => "/tmp/metal-amd64.iso"
      domain.storage :file, :size => '4G', :type => 'raw'
      domain.boot 'hd'
      domain.boot 'cdrom'
    end
  end
end

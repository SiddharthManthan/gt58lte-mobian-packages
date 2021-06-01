  
Vagrant.configure("2") do |config|
    config.vm.box = "debian/bullseye64"

    config.vm.define 'debian'

    # Prevent SharedFoldersEnableSymlinksCreate errors
    config.vm.synced_folder ".", "/vagrant", disabled: true
  
    config.vm.provision "shell", inline: <<-SHELL
      ## Setup build env
      sudo dpkg --add-architecture arm64
      sudo apt-get update
      sudo apt-get -y install build-essential crossbuild-essential-arm64 git debhelper
    SHELL
end

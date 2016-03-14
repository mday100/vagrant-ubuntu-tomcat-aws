Vagrant.configure(2) do |config|

  #Development Box
  config.vm.define "dev" do |dev|
    config.vm.box = "ubuntu/trusty64"
    config.vm.network "public_network", bridge: "en1: Wi-Fi (AirPort)"
    config.vm.hostname = "fdm-box"
  end

  #Production Box
  config.vm.define "prod" do |prod|
    prod.vm.box = "dummy"

    prod.vm.provider "aws" do |aws, override|
      aws.region_config "us-west-2", :ami => "ami-9abea4fb"
      aws.region = "us-west-2"
      aws.instance_type = "t2.micro"

      aws.tags = {
        'Name' => 'FDM'
      }

      override.ssh.username = "ubuntu"
      aws.keypair_name = "fdm"
      override.ssh.private_key_path = "[PEM PATH]"

      aws.access_key_id = "[ACCESS KEY ID]"
      aws.secret_access_key = "[SECRET ACCESS KEY]"
    end
  end

  #Provisioning Script
  config.vm.provision "shell", path: "provision.sh"

end

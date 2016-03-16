Vagrant.configure(2) do |config|

  #Development Box
  config.vm.define "dev" do |dev|
    dev.vm.box = "ubuntu/trusty64"
    dev.vm.network "public_network", bridge: "en1: Wi-Fi (AirPort)"
    dev.vm.hostname = "fdm-box"

  	#Synced Folders for Windows Client
  	#dev.vm.synced_folder "C:\\Users\\trainee1.TRNNYC30534\\Documents\\workspace", "/opt/tomcat/workspace"
  	#dev.vm.synced_folder "C:\\Users\\trainee1.TRNNYC30534\\Documents\\workspace\\IssueTrackingSystem\\assets", "/opt/tomcat/webapps/IssueTrackingSystem/assets"
  	#dev.vm.synced_folder "C:\\Users\\trainee1.TRNNYC30534\\Documents\\workspace\\IssueTrackingSystem\\web", "/opt/tomcat/webapps/IssueTrackingSystem/web"

    #Port Forwarding for Vagrant Share
    #dev.vm.network "forwarded_port", guest: 8080, host: 8080, id: "tomcat"
  end

  #Production Box
  config.vm.define "prod" do |prod|
    prod.vm.box = "dummy"
	  prod.vm.synced_folder '.', '/vagrant', disabled: true

    #AWS Information
    prod.vm.provider "aws" do |aws, override|
      aws.region_config "us-west-2", :ami => "ami-9abea4fb"
      aws.region = "us-west-2"
      aws.instance_type = "t2.micro"

      aws.tags = {
        'Name' => 'INSTANCE NAME'     #instance name
      }

      override.ssh.username = "ubuntu"
      aws.keypair_name = "KEY NAME"     #keypair name
      override.ssh.private_key_path = "PEM PATH"     #location of ssh pem file

      aws.access_key_id = "YOUR ACCESS KEY ID"     #access key id
      aws.secret_access_key = "YOUR SECRET ACCESS KEY"     #secret access key
    end
  end

  #Provisioning Script
  config.vm.provision "shell", path: "provision.sh"

end

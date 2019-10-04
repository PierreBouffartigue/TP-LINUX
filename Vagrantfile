Vagrant.configure("2") do |config|
 
  config.vm.box = "generic/debian10"
  config.vm.define "wiki" do |wiki|
    wiki.vm.network "private_network" , ip: "192.168.20.12"
    wiki.vm.network "forwarded_port", guest: 80, host: 8080
    wiki.vm.hostname = "wiki"
  

end

  
  config.vm.define "backup" do |backup|
    backup.vm.network "private_network", ip: "192.168.20.6"
    backup.vm.network "forwarded_port", guest: 80, host: 8181
    backup.vm.hostname = "backup"
  end
    config.vm.provision "shell", inline: <<-SHELL
    export DEBIAN_FRONTEND=noninteractive
    sudo apt-get update
    sudo apt-get install php-geshi -y
    cd /tmp
    wget https://download.dokuwiki.org/src/dokuwiki/dokuwiki-stable.tgz
    tar -xvf dokuwiki-stable.tgz
    sudo rm /var/www/html/index.html
    sudo cp -r dokuwiki-2018-04-22b/* /var/www/html/
    sudo chown -R www-data /var/www/html/
	sudo apt-get update && apt-get install rsync
  SHELL
end

## <a name='toc'>Tools list:</a>

  1. [Ansible](#ansible)
  1. [Apache Web](#apache)
  1. [CloudFormation](#cloudFormation)
  1. [Docker](#docker)
  1. [Vagrant](#vagrant)
  1. [LXD](LXD.md)
  1. [Nginx](#nginx)
  1. [KVM](#kvm)
  1. [AutoBackupMySQL](/autobackupmysql.sh)
  1. [Rsnapshot](rsnapshot.conf)
  1. [Terraform](#terraform)
  1. [Teleconsole](#teleconsole)


#### <a name='ansible'>Ansible examples:</a>

* [LEMP server + WordPress (CentOS7)](/ansible/LEMP-server-wordpress/)
* [MySQL](/ansible/mysql-test.yml)


#### [[⬆]](#toc) <a name='apache'>Apache VirtualHost Examples:</a>

* [Apache Nextcloud conf](/apache/nextcloud.conf)
* [Apache Nextcloud2 conf](/apache/nextcloudSimple.conf)
* [Apache zendFramework](/apache/zendFramework.conf)


#### <a name='cloudFormation'>CloudFormation examples:</a>

* [CloudFormation EC2 Instance Ubuntu20.04](/cloudFormation/ec2-ubuntu20.yml)
* [CloudFormation SecurityGroups](/cloudFormation/ec2-securityGroup.yml)


#### [[⬆]](#toc) <a name='docker'>Docker examples:</a>

* [MariaDB + Mediawiki Docker Compose](/docker/docker-compose_mediawiki.yml)


#### [[⬆]](#toc) <a name='vagrant'>Vagrant examples:</a>

* [Vagrant + LXC plugin](/vagrant/vagrant-lxc/Vagrantfile)
* [Vagrant + libvirt plugin (KVM)](/vagrant/vagrant-kvm/Vagrantfile)
* [Vagrant + VirtualBox](/vagrant/vagrant-virtualbox/Vagrantfile)


#### [[⬆]](#toc) <a name='nginx'>Nginx examples:</a>

* [Nginx Reverse Proxy](/nginx/reverse-proxy.conf)
* [Nginx HTTP Load Balancing](/nginx/load-balancer-http.conf)
* [Nginx TCP and UDP Load Balancing](/nginx/load-balancer-tcp.conf)
* [Using PROXY Protocol for receiving IP](/nginx/proxy-protocol.conf)
* [Nginx config for Nextcloud](/nginx/nextcloud.conf)
* [Nginx + php-fpm for Mediawiki](/nginx/mediawiki.conf)
* [Nginx (mix)](/nginx/nginx.conf)


#### <a name='kvm'>libvirt(kvm) scripts:</a>

* [Simple script for backuping libvirt images + xml confs](/kvm/libvirt-backup.sh)
* [Stop all running vms](/kvm/vms-stop.sh)


#### <a name='terraform'>Terraform examples:</a>

* [Terraform test GCP](/terraform/googleStart.tf)
* [Terraform test AWS](/terraform/awsStart.tf)


#### [[⬆]](#toc) <a name='teleconsole'>Teleconsole - terminal sharing:</a>
```bash
#install:
curl https://www.teleconsole.com/get.sh | sh
#start service:
teleconsole
#client connect:
teleconsole join <session ID> 
# access through web:
https://teleconsole.com/s/ace723ba055a28c66ae22b7a13c18d44fbc5a8b8 
```
Source: https://github.com/gravitational/teleconsole

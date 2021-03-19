Useful linux tools (config examples)
==================================

## <a name='toc'>Content list</a>

  1. [Ansible](#ansible)
  1. [Docker](#docker)
  1. [Teleconsole](#teleconsole)



#### <a name='ansible'>Ansible examples:</a>

* [LEMP server + WordPress (CentOS7)](/ansible/LEMP-server-wordpress/)
* [MySQL example](/ansible/mysql-test.yml)


#### [[⬆]](#toc) <a name='docker'>Docker examples:</a>

* [MariaDB + Mediawiki Docker Compose](/docker/docker-compose_mediawiki.yml)


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

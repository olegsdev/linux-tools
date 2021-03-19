## LEMP + WordPress Deployment

- Requires Ansible 2.3 or newer
- CentOS 7

This playbook Contain Ansible role and needed files and help to deploy wordpress with the database.

Then run the playbook, like this:

	ansible-playbook -i hosts wordpress.yml

The playbooks will configure MariaDB, WordPress, Nginx, and PHP-FPM. When the run
is complete, you can hit access server to begin the WordPress configuration.

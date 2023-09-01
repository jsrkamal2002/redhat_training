echo "*******************************"
echo ""
echo "EVALUATION SCRIPT STARTING NOW !!!!"
echo ""
echo "*******************************"
echo ""
echo "Install and Configure Ansible on the control node "
echo ""
ansible all -m command -a 'id' | grep root
echo ""
echo "*******************************"
echo ""
echo "configuring repository in all nodes"
echo ""
ansible all -m command -a 'dnf repolist all' | grep baseos
echo ""
ansible all -m command -a 'dnf repolist all' | grep appstream
echo ""
echo "*******************************"
echo ""
echo "Installing the collection on the control node"
echo ""
ls /home/student/ansible/collections/ansible_collections
echo ""
echo "*******************************"
echo ""
echo "Installing the roles on the control node"
echo ""
ls /home/student/ansible/roles | grep balancer
ls /home/student/ansible/roles | grep phpinfo
echo ""
echo "*******************************"
echo ""
echo "Creation and Using the offline role"
echo ""
echo ""
echo "Checking the creation of the role"
echo ""
ls /home/student/ansible/roles | grep apache
echo ""
echo "Checking the template of the role"
echo ""
cat /home/student/ansible/roles/apache/templates/template.j2
echo ""
echo "Checking the tasks of the role"
echo ""
cat /home/student/ansible/roles/apache/tasks/main.yml
echo ""
echo "Checking success of the role"
echo ""
curl http://servera.lab.example.com
echo ""
echo "*******************************"
echo ""
echo "Using the online role"
echo ""
echo "Check it by yourself by curling serverd twice"
echo ""
echo "*******************************"
echo ""
echo "Timesync role"
echo ""
ansible all -m command -a 'cat /etc/chrony.conf' | grep hostname
ansible all -m command -a 'cat /etc/chrony.conf' | grep iburst
echo ""
echo "*******************************"
echo ""
echo "SELinux role"
echo ""
# ansible all -m command -a 'getenforce' | grep Enforcing
ansible all -m command -a "cat /etc/selinux/config" | grep enforcing
ansible all -m command -a "cat /etc/selinux/config" | grep targeted
echo ""
echo "*******************************"
echo ""
echo "Packages in Multiple groups"
echo ""
ansible dev  -m command -a 'dnf list installed |grep vsftpd'
ansible dev  -m command -a 'dnf list installed |grep mariadb-server'
echo ""
echo ""
ansible prod -m command -a 'dnf group list'
echo ""
echo "*******************************"
echo ""
echo "Webcontent playbook"
echo ""
ansible devops -m command -a 'ls / | grep devweb'
echo ""
ansible devops -m command -a 'ls /devweb'
echo ""
ansible devops -m command -a 'ls -la /var/www/html/devweb'
echo ""
curl http://servera.lab.example.com/devweb/
echo ""
echo "*******************************"
echo ""
echo "Hardware report"
echo ""
ansible all -m command -a 'cat /root/hwreport.txt'
echo ""
echo "*******************************"
echo ""
echo "Replace file content"
echo ""
ansible all -m command -a 'cat /etc/issue'
echo ""
echo "*******************************"
echo ""
echo "Custom Host File"
echo ""
cat /home/student/ansible/myhosts.j2
echo ""
ansible dev -m command -a 'cat /etc/myhosts'
echo ""
echo "*******************************"
echo ""
echo "Creating vault file"
echo ""
ansible-vault view vault.yml --vault-password-file=secret.txt
echo ""
echo "*******************************"
echo ""
echo "Creating user"
echo ""
ansible dev  -m command -a 'tail /etc/group'
echo ""
echo ""
ansible test -m command -a 'tail /etc/group'
echo ""
echo "*******************************"
echo ""
echo "Checking the rekey of vault file"
echo ""
echo "redhat" >> hi.txt
ansible-vault view solaris.yml --vault-password-file=hi.txt
rm -rf hi.txt
echo ""
echo "*******************************"
echo ""
echo "Checking the crontab"
echo ""
ansible all -m command -a "crontab -lu student"
echo ""
echo "*******************************"
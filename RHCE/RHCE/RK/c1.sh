echo ""
echo ""
echo "					Ansible script is running please wait		"
echo ""
echo "QUESTION 1"
echo ""
echo ""
cat inventory
echo ""
echo ""
cat ansible.cfg
echo ""
echo ""
ansible all --list-hosts
echo ""
echo ""
ansible all -m command -a 'id'
echo ""
echo "##########################################################################################"
echo ""
echo "QUESTION 2"
echo ""
echo ""
cat adhoc.sh
echo ""
echo ""
sh adhoc.sh
echo ""
echo ""
ansible all -m command -a 'yum repolist all'
echo ""
echo "##########################################################################################"
echo ""
echo "QUESTION 3"
echo ""
echo ""
cat roles/requirements.yml
echo ""
echo ""
rm -rf roles/balancer/ roles/phpinfo/
ansible-galaxy  install -r roles/requirements.yml  -p roles
echo ""
echo "List the roles directory"
echo ""
ls roles
echo ""
echo "##########################################################################################"
echo ""
echo "QUESTION 4"
echo ""
echo ""
cat roles/apache/templates/index.html.j2 
echo ""
echo ""
cat roles/apache/tasks/main.yml
echo ""
echo ""
ansible-playbook  newrole.yml
echo ""
echo "Check the output from the command 'curl servera.lab.example.com' "
echo ""
curl servera.lab.example.com
echo ""
echo "##########################################################################################"
echo ""
echo "QUESTION 5"
echo ""
echo ""
cat roles.yml
echo ""
echo ""
ansible-playbook  roles.yml
echo ""
echo ""
curl servera.lab.example.com
echo ""
echo ""
curl serverb.lab.example.com
echo ""
echo ""
curl serverc.lab.example.com
echo ""
echo ""
curl serverd.lab.example.com
echo ""
echo "##########################################################################################"
echo ""
echo "QUESTION 6"
echo ""
echo ""
cat timesync.yml
echo ""
echo ""
ansible-playbook  timesync.yml
echo ""
echo "Check the /etc/chrony.conf file in all nodes"
echo ""
ansible all -m command -a 'cat /etc/chrony.conf'
echo ""
echo "check for chronyc sources"
echo ""
ansible all -m command -a 'chronyc sources'
echo ""
echo "##########################################################################################"
echo ""
echo "QUESTION 7"
echo ""
echo ""
cat packages.yml
echo ""
echo ""
ansible-playbook  packages.yml
echo ""
echo ""
ansible dev -m command -a 'yum list installed |grep php'
echo ""
echo ""
ansible prod -m command -a 'yum group list'
echo ""
echo "##########################################################################################"
echo ""
echo "QUESTION 8"
echo ""
echo ""
cat webcontent.yml
echo ""
echo ""
ansible-playbook  webcontent.yml
echo ""
echo ""
ansible dev -m command -a 'ls -ldZ /webdev'
echo ""
echo ""
ansible dev -m command -a 'ls -ldZ /webdev/index.html'
echo ""
echo "CHECK FOR URL 'servera.lab.example.com/webdev/'"
echo ""
curl servera.lab.example.com/webdev/
echo ""
echo "##########################################################################################"
echo ""
echo "QUESTION 9"
echo ""
echo ""
ansible-vault  view vault.yml  --vault-password-file=secret.txt
echo ""
echo "##########################################################################################"
echo ""
echo "QUESTION 10"
echo ""
echo ""
cat users.yml
echo ""
echo ""
ansible-playbook  users.yml  --vault-password-file=secret.txt
echo ""
echo "CHECK THE USER & GROUP FILE IN DEV GROUP"
echo ""
echo ""
ansible dev  -m command -a 'grep -e user1 -e user2 -e user3  /etc/passwd'
echo ""
ansible dev  -m command -a 'grep -e user1 -e user2 -e user3  /etc/shadow'
echo ""
ansible dev  -m command -a 'grep -e development -e management /etc/group'
echo ""
echo "CHECK THE USER & GROUP FILE IN TEST GROUP"
echo ""
echo ""
ansible test -m command -a 'grep -e user1 -e user2 -e user3  /etc/passwd'
echo ""
ansible test -m command -a 'grep -e user1 -e user2 -e user3  /etc/shadow'
echo ""
ansible test -m command -a 'grep -e development -e management /etc/group'
echo ""
echo "CHECK THE USER & GROUP FILE IN PROD GROUP"
echo ""
echo ""
ansible prod -m command -a 'grep -e user1 -e user2 -e user3  /etc/passwd'
echo ""
ansible prod -m command -a 'grep -e user1 -e user2 -e user3  /etc/shadow'
echo ""
ansible prod -m command -a 'grep -e development -e management /etc/group'
echo ""

echo "##########################################################################################"
echo ""
echo "QUESTION 11"
echo ""
echo ""
cat hwreport.yml
echo ""
echo ""
ansible-playbook hwreport.yml
echo ""
echo ""
ansible all -m command -a 'cat /root/hwreport.txt'
echo ""
echo "##########################################################################################"
echo ""
echo "QUESTION 12"
echo ""
echo ""
cat issue.yml
echo ""
echo ""
ansible-playbook   issue.yml
echo ""
echo ""
ansible all -m command -a 'cat /etc/issue'
echo ""
echo "##########################################################################################"
echo ""
echo "QUESTION 13"
echo ""
echo ""
cat host.j2
echo ""
cat hosts.yml
echo ""
ansible-playbook  hosts.yml
echo ""
echo ""
ansible dev -m command -a 'cat /etc/myhosts'
echo ""
echo ""
sh initialscripts.sh  > /dev/null 2>&1
echo ""
echo "##########################################################################################"
echo ""
echo "QUESTION 14"
echo ""
echo ""
cat solaris.yml
echo ""
echo redhat  >  redhat
echo ""
ansible-vault view solaris.yml --vault-password-file=redhat
echo ""
echo "##########################################################################################"
echo ""
echo "QUESTION 15"
echo ""
echo ""
cat crontab.yml
echo ""
echo ""
ansible-playbook   crontab.yml
echo ""
echo ""
ansible all -m command -a 'crontab -lu student'
echo ""
echo "##########################################################################################"
echo ""
echo "QUESTION 16"
echo ""
echo ""
cat lvm.yml
echo ""
echo ""
ansible-playbook lvm.yml
echo ""
echo ""
ansible all -m command -a 'lsblk'
echo ""
echo ""
ansible all -m command -a 'lsblk -fp'
echo ""
echo ""
ansible all -m command -a 'blkid'
echo ""
echo ""

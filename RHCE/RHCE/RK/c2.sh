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
ansible all -m command -a 'yum repolist'
echo ""
echo "##########################################################################################"
echo ""
echo "QUESTION 3"
echo ""
echo ""
cat role/requirements.yml
echo ""
echo ""
rm -rf role/balancer/ role/phpinfo/
ansible-galaxy  install -r role/requirements.yml  -p role
echo ""
echo ""
echo "List the roles the directory"
ls role
echo ""
echo "##########################################################################################"
echo ""
echo "QUESTION 4"
echo ""
echo ""
cat role/apache/templates/template.j2 
echo ""
echo ""
cat role/apache/tasks/main.yml
echo ""
echo ""
ansible-playbook  apache_role.yml
echo ""
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
ansible web  -m command -a 'yum list installed |grep autofs'
echo ""
ansible asia -m command -a 'yum group list'
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
ansible web -m command -a 'ls -ldZ /vectra'
echo ""
echo ""
ansible web -m command -a 'ls -ldZ /vectra/index.html'
echo ""
echo ""
echo "CHECK FOR URL 'servera.lab.example.com/vectra/' "
echo ""
echo ""
curl servera.lab.example.com/vectra/
echo ""
echo "##########################################################################################"
echo ""
echo "QUESTION 9"
echo ""
echo ""
ansible-vault  view secret.yml  --vault-password-file=pass.txt
echo ""
echo "##########################################################################################"
echo ""
echo "QUESTION 10"
echo ""
echo ""
cat users.yml
echo ""
echo ""
ansible-playbook  users.yml  --vault-password-file=pass.txt
echo ""
echo ""
echo "CHECK THE USER & GROUP FILE IN WEB GROUP"
echo ""
echo ""
ansible web -m command -a 'grep -e user1 -e user2 -e user3  /etc/passwd'
echo ""
echo ""
ansible web -m command -a 'grep -e user1 -e user2 -e user3  /etc/shadow'
echo ""
echo ""
ansible web -m command -a 'tail -7 /etc/group'
echo ""
echo ""
echo "CHECK THE USER & GROUP FILE IN DB GROUP"
echo ""
echo ""
ansible db -m command -a 'grep -e user1 -e user2 -e user3  /etc/passwd'
echo ""
echo ""
ansible db -m command -a 'grep -e user1 -e user2 -e user3  /etc/shadow'
echo ""
echo ""
ansible db -m command -a 'tail -7 /etc/group'
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
cat myhosts.j2
echo ""
cat hosts.yml
echo ""
ansible-playbook   hosts.yml
echo ""
echo ""
ansible web -m command -a 'cat /etc/host'
echo ""
echo "##########################################################################################"
echo ""
echo "QUESTION 14"
echo ""
echo ""
cat salary.yml
echo ""
echo redhat  >  redhat
echo ""
ansible-vault view salary.yml --vault-password-file=redhat
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
sh initialscripts.sh   > /dev/null 2>&1
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

# ssh to vm box ansible1
ssh -p 19981 duongtn1512@127.0.0.1

# ansible install
sudo apt update 
sudo apt install software-properties-common 
sudo add-apt-repository --yes --update ppa:ansible/ansible 
sudo apt install ansible
wsl ansible --version

cd /etc/ansible

# hosts file store addr of taraget machine we want to connect
[localhost] 
127.0.0.1 
[lap_app]
3.84.93.131 ansible_ssh_user=ec2-user ansible_ssh_private_key_file=Key_AWS_1.pem

# connect to taraget machine
ssh -i key/key5.pem ubuntu@3.84.93.131

# ping to check connection, taraget machine must turn on sg allow to get ping
wsl ansible lap_app -m ping 

# mount file from vmbox machine to host machine
sudo mount -t vboxsf AWS_key ~/shared

wsl ansible-playbook /playbook/install-nginx.yml 
wsl ansible-playbook playbook-2.yml 
wsl ansible-playbook playbook-3.yml 

ssh -i D:\Devops_FPT_Foudations\AWS_key\Key_AWS_1.pem ec2-user@3.84.93.131
ssh -i etc\ansible\Key_AWS_1.pem ec2-user@3.84.93.131
ssh -i Key_AWS_1.pem ec2-user@3.84.93.131


ip --brief addr show

# aws cli
aws sts get-caller-identity
aws configure list
aws configure 

# teraform
terraform init
terraform apply --auto-approve
terraform destroy --auto-approve
terraform plan

# pass time 5h in vm box ubuntu
  275  cat ansible/inventory/lap
  276  ssh -i key/key5.pem ubuntu@13.212.116.75
  277  terraform apply --auto-approve
  278  terraform destroy --auto-approve
  279  terraform apply --auto-approve
  280  terraform destroy --auto-approve
  281  rm ansible/playbook/install-jenkins-container.yml
  282  nano ansible/playbook/install-jenkins-container.yml
  283  terraform apply --auto-approve
  284  ssh -i key/key5.pem ubuntu@13.212.239.255
  285  terraform destroy --auto-approve
  286  rm ansible/playbook/install-jenkins-container.yml
  287  nano ansible/playbook/install-jenkins-container.yml
  288  terraform apply --auto-approve
  289  terraform destroy --auto-approve
  290  rm ansible/playbook/install-jenkins-container.yml
  291  nano ansible/playbook/install-jenkins-container.yml
  292  terraform apply --auto-approve
  293  history
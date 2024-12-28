# Ansible user
variable "ansible_user" {
  type        = string
  description = "Ansible user used to connect to the instance"
  default     = "ubuntu"
}

# Key
variable "ansible_ssh_private_key_file" {
  type        = string
  description = "ssh key file to use for ansible_user"
  default     = "./key/key5.pem"
}
variable "ansible_ssh_public_key_file" {
  type        = string
  description = "ssh public key in server authorized_keys"
  default     = "./key/key5.pub"
}

# Host path
variable "ansible_host_path" {
  type        = string
  description = "path to ansible inventory host"
  default     = "./ansible/inventory/lap"
}

# Command to run
variable "ansible_command" {
  default     = "./ansible/playbook/install-jenkins-container.yml"
  description = "Command for container lab hosts"
}
# Command path
variable "ansible_wsl_host_path" {
  default     = "./ansible/inventory/lap"
  description = "Command for container lab hosts"
}
# Key path
variable "ansible_wsl_private_key_path" {
  default     = "./key/key5.pem"
  description = "Command for container lab hosts"
}


# variable "ansible_ssh_pass" {
#   default = "Passw0rd"
# }
#
# variable "ansible_python" {
#   type        = string
#   description = "path to python executable"
#   default     = "/usr/bin/python3"
# }
# 
# variable "instance_type" {
#   default = "c7g.2xlarge"
# }

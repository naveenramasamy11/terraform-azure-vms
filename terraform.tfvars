master_vm_1 = "nav-k8s-mas1"
worker_vm_1 = "nav-k8s-wor1"
worker_vm_2 = "nav-k8s-wor2"
location = "East US"
vm_size = "Standard_D2S_v3"
resource_group = "kubernetes"
username = "naveen"
managed_disk_type = "Standard_LRS"
ssh_public_key = "~/.ssh/id_rsa.pub"
ssh_key_target_path = "/home/naveen/.ssh/authorized_keys" #Ensure you declare the username you defined above in the path

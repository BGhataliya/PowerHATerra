data "ibm_pi_image" "data_source_image" {
  pi_cloud_instance_id = var.cloud_instance_id
  pi_image_name        = var.image_name
}

data "ibm_pi_network" "data_source_network" {
  pi_network_name      = "VPNsubnet4"
  pi_cloud_instance_id = var.cloud_instance_id
}
resource "ibm_pi_volume" "volume" {
  pi_cloud_instance_id = var.cloud_instance_id
  pi_volume_name       = var.volume_name
  pi_volume_type       = var.volume_type
  pi_volume_size       = var.volume_size
  pi_volume_shareable  = var.volume_shareable
}
data "ibm_pi_volume" "data_source_volume" {
  depends_on = [ibm_pi_volume.volume]
 
  pi_cloud_instance_id = var.cloud_instance_id
  pi_volume_name       = var.volume_name
}
resource "ibm_pi_instance" "instance" {
  depends_on = [data.ibm_pi_image.data_source_image,
  data.ibm_pi_network.data_source_network]

  pi_cloud_instance_id = var.cloud_instance_id
  pi_instance_name     = var.instance_name
  pi_memory            = var.memory
  pi_processors        = var.processors
  pi_proc_type         = var.proc_type
  pi_storage_type      = var.storage_type
  pi_sys_type          = var.sys_type
  pi_image_id          = data.ibm_pi_image.data_source_image.id
  pi_network { network_id = data.ibm_pi_network.data_source_network.id }
  pi_volume_ids = [data.ibm_pi_volume.data_source_volume.id]
}
data "ibm_pi_instance" "data_source_instance" {
  depends_on = [ibm_pi_instance.instance]

  pi_cloud_instance_id = var.cloud_instance_id
  pi_instance_name     = var.instance_name
}
resource "ibm_pi_volume_attach" "volume_attach" {
  depends_on = [ibm_pi_instance.instance]

  pi_cloud_instance_id = var.cloud_instance_id
  pi_volume_id         = data.ibm_pi_volume.data_source_volume.id
  pi_instance_id       = data.ibm_pi_instance.data_source_instance.id
}

# resource "terraform_data" "onPrim_node" {
#   connection {
#     type             = "ssh"
#     bastion_host     = "172.16.118.88"
#     bastion_user     = "root"
#     bastion_password = "Ar1cent@123"
#     user             = "root"
#     host             = "192.168.107.76"
#     password         = "Ar1cent@123"
#     agent            = false
#     timeout          = "10m"
#   }

#   provisioner "remote-exec" {
#     inline = ["echo 'Hello'", "lspv", "df -g"]
#   }
# }

# resource "terraform_data" "OnPremise" {
#   connection {
#     type             = "ssh"
#     user             = "root"
#     host             = "172.16.118.88"
#     password         = "Ar1cent@123"
#     agent            = false
#     timeout          = "60m"
#   }

#   provisioner "remote-exec" {
#     inline = ["export PATH=$PATH:/usr/es/sbin/cluster/utilities/", "cd /.ansible/collections/ansible_collections/ibm/power_ha/playbooks", "/opt/freeware/bin/ansible-playbook demo_PowerHA.yml --tags uninstall"]
#   }
# }


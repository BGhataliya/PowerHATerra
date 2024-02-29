
data "ibm_pi_network" "data_source_network" {
  pi_network_name      = "mgmt_net"
  pi_cloud_instance_id = var.cloud_instance_id
}

resource "ibm_pi_instance" "instance" {
  depends_on = [data.ibm_pi_network.data_source_network]

  pi_cloud_instance_id = var.cloud_instance_id
  pi_instance_name     = var.instance_name
  pi_memory            = var.memory
  pi_processors        = var.processors
  pi_proc_type         = var.proc_type
  pi_storage_type      = var.storage_type
  pi_sys_type          = var.sys_type
  pi_image_id          = var.image_name
  pi_network { network_id = data.ibm_pi_network.data_source_network.id }
  
}
data "ibm_pi_instance" "data_source_instance" {
  depends_on = [ibm_pi_instance.instance]

  pi_cloud_instance_id = var.cloud_instance_id
  pi_instance_name     = var.instance_name
}
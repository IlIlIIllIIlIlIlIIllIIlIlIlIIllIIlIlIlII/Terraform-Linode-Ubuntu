terraform {
  required_providers {
    linode = {
      source  = "linode/linode"
      
    }
  }
}

# Configure the Linode Provider
provider "linode" {
  token = var.token
}

resource "random_password" "password" {
  length           = 16
  special          = true
}


resource "linode_instance" "server" {
    label = var.server-name
    image = "linode/ubuntu20.04"
    region = "us-west"
    type = "g6-standard-1"
    authorized_keys = [var.ssh-key]
    root_pass = random_password.password.result

    group = "foo"
    tags = [ "Terraform" ]
    swap_size = 256
    private_ip = true
    backups_enabled = false

}



output "ip-address" {
  value = linode_instance.server.ip_address
}

output "password"{
  value = random_password.password
  sensitive = true
}



/*locals {
  admin_username       = "testadmin"
  admin_password       = "Password1234!"
}*/

/*variable "vmip" {
  description = "Azure VM IP Address on which Docker needs to be installed"
}*/

/*# Configure the Microsoft Azure Provider
provider "azurerm" {
    alias = "azurerm"
}*/

/*module "azurejvm" {
  source = "./AzureVM"
  providers = {
    azurerm = "azurerm.azurerm"
  }
}*/

variable "vm_ip_address" {}

provider "docker" {
    host = "tcp://${var.vm_ip_address}:2376"
    alias = "docker"
}

resource "docker_container" "container" {
  name  = "jenkins_image"
  image = "${docker_image.jenkins.lts}"
  ports {
      internal = 80
      external = 80
  }
}

# Find the latest Jenkins precise image.
resource "docker_image" "jenkins" {
  name = "jenkins/jenkins:lts"
}

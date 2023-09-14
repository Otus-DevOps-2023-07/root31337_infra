terraform {
  required_providers {
    yandex = {
      source  = "yandex-cloud/yandex"
      version = "0.95.0"
    }
  }
}

provider "yandex" {
 service_account_key_file = var.service_account_key_file
 cloud_id = var.cloud_id
 folder_id = var.folder_id
 zone = var.zone
}

resource "yandex_compute_instance" "app" {
 name = "reddit-app"
 resources {
 cores = 2
 memory = 2
 }
#  metadata = {
#  ssh-keys = "ubuntu:${file("~/.ssh/ubuntu.pub")}"
#  }
#  boot_disk {
#  initialize_params {
#  # Указать id образа созданного в предыдущем домашнем задании
#  image_id = "fd89glgotaq3e6d2jjta"
#  }
#  }
#  network_interface {
#  # Указан id подсети default-ru-central1-a
#  subnet_id = "e9b24d2brea26rc2tc3a"
#  nat = true
#  }
 boot_disk {
 initialize_params {
 image_id = var.image_id
 }
 }
 network_interface {
 subnet_id = var.subnet_id
 nat = true
 }
 metadata = {
 ssh-keys = "ubuntu:${file(var.public_key_path)}"
 }

 connection {
 type = "ssh"
 host = yandex_compute_instance.app.network_interface.0.nat_ip_address
 user = "ubuntu"
 agent = false
 # путь до приватного ключа
 private_key = var.private_key
 }

 provisioner "file" {
 source = "files/puma.service"
 destination = "/tmp/puma.service"
 }

 provisioner "remote-exec" {
 script = "files/deploy.sh"
 }
}

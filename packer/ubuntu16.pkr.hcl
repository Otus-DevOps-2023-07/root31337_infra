
source "yandex" "ubuntu16" {
  service_account_key_file = "/home/maxwell/Otus/key.json"
  folder_id = "b1g8n9nr04rmukr2rt1g"
  source_image_family = "ubuntu-1604-lts"
  image_name = "reddit-base-${formatdate("MM-DD-YYYY", timestamp())}"
  image_family = "reddit-base"
  ssh_username = "ubuntu"
  platform_id = "standard-v1"
  subnet_id = "enpi36d0smqvap3bpd1g"
  zone = "ru-central1-a"
  use_ipv4_nat = true
}

build {
  sources = ["source.yandex.ubuntu16"]

  provisioner "shell" {
    name            = "ruby"
    script          = "./scripts/install_ruby.sh"
    execute_command = "sudo {{.Path}}"
  }

  provisioner "shell" {
    name            = "mongodb"
    script          = "./scripts/install_mongodb.sh"
    execute_command = "sudo {{.Path}}"
  }
}

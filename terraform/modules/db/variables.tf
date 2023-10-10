variable "cloud_id" {
  description = "Cloud"
  default     = ""
}
variable "folder_id" {
  description = "Folder"
  default = "b1g5q2lccug3i0j92ksh"
}
variable "zone" {
  description = "Zone"
  # Значение по умолчанию
  default = "ru-central1-a"
}
variable "public_key_path" {
  # Описание переменной
  description = "~/.ssh/yc-user.pub"
}
variable "private_key_path" {
  # Описание переменной private key
  description = "Path to the private key"
  default = "~/.ssh/yc-user"
}
variable "image_id" {
  description = "Disk image"
  default     = "fd8rjvlkb3ma424svaon"
}
variable "subnet_id" {
  description = "Subnet"
}
variable "service_account_key_file" {
  description = "/home/ubuntu/git/key.json"
  default = "/home/ubuntu/git/key.json"
}
variable app_disk_image {
  description = "Disk image for reddit app"
  default = "reddit-app"
}
variable db_disk_image {
description = "Disk image for reddit db"
default = "reddit-db-base"
}

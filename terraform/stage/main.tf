terraform {
# required_providers {
#     yandex = {
#       source  = "yandex-cloud/yandex"
#       version = "0.95.0"
#     }
#   }
}

module "vpc" {
  source = "../modules/vpc"
}

provider "yandex" {
 service_account_key_file = var.service_account_key_file
 cloud_id = var.cloud_id
 folder_id = var.folder_id
 zone = var.zone
}
module "app" {
 source = "../modules/app"
 subnet_id = module.vpc.vpc_id
 public_key_path = var.public_key_path
 app_disk_image = var.app_disk_image

}
module "db" {
 source = "../modules/db"
 subnet_id = module.vpc.vpc_id
 public_key_path = var.public_key_path
 db_disk_image = var.db_disk_image

}

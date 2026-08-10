terraform {
  required_version = ">= 1.12.0"

  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "~> 2.5"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.6"
    }
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0"
    }
    vault = {
  source  = "hashicorp/vault"
  version = "~> 4.0"
}
  }
  cloud {
  organization = "Practice_IAC"

  workspaces {
    name = "week1-local-docker"
  }
}
  
}

provider "docker" {}
module "site_prod_blue" {
  source = "./modules/nginx-site"

  container_name = "tf-prep-nginx-blue"
  container_port = 8080
}

module "site_green" {
  source = "./modules/nginx-site"

  container_name = "tf-prep-nginx-green"
  container_port = 8081
}
module "label" {
  source  = "cloudposse/label/null"
  version = "~> 0.25"

  namespace = "tfprep"
  name      = "nginx"
}
data "docker_network" "bridge" {
  name = "bridge"
}
output "bridge_network_id" {
  value = data.docker_network.bridge.id
}
resource "local_file" "scratch" {
  filename = "${path.module}/scratch.txt"
  content  = "practice removed block"
}
resource "docker_container" "manual" {
  name  = "manual-nginx"
  image = "nginx:alpine"
}
provider "vault" {}

data "vault_kv_secret_v2" "db" {
  mount = "secret"
  name  = "myapp/db"
}

resource "local_file" "vault_secret_demo" {
  filename = "${path.module}/vault_secret_demo.txt"
  content  = data.vault_kv_secret_v2.db.data["password"]
}
moved {
  from = module.site_blue
  to   = module.site_prod_blue
}
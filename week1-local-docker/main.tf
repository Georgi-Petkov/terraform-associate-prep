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
  }
}

provider "docker" {}
module "site_blue" {
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

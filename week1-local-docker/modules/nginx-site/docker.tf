resource "docker_image" "nginx" {
  name         = "nginx:alpine"
  keep_locally = true
}

resource "docker_container" "web" {
  name  = "${var.container_name}-${random_pet.lab.id}"
  image = docker_image.nginx.image_id

  ports {
    internal = 80
    external = var.container_port
  }

  lifecycle {
    create_before_destroy = true
    ignore_changes        = [image]
    precondition {
      condition     = var.container_port != 80
      error_message = "container_port must not be 80 — that's the container's internal port."
    }

    postcondition {
      condition     = self.name == "${var.container_name}-${random_pet.lab.id}"
      error_message = "Container name did not match the expected pattern after creation."
    }
  }
}

variable "container_name" {
  description = "Name for the Docker container"
  type        = string
  default     = "tf-prep-nginx"
}

variable "container_port" {
  description = "Host port to publish the container's port 80 on"
  type        = number
  default     = 8080

  validation {
    condition     = var.container_port > 1024 && var.container_port < 65536
    error_message = "container_port must be between 1025 and 65535."
  }
}

variable "greeting_tags" {
  description = "Example of a map/complex type input"
  type        = map(string)
  default = {
    purpose = "terraform-associate-004-prep"
    owner   = "george"
  }
}
variable "animal_img_link" {
  description = "S3 bucket img links"
  type = list(object({
    filename = string
    content  = string
  }))
  default = [
    { filename = "unicorn_img", content = "some_url_1" },
    { filename = "pegasus_img", content = "some_url_2" },
  ]
}
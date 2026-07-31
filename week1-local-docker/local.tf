resource "random_pet" "lab" {
  length = 2
}

resource "local_file" "greeting" {
  filename = "${path.module}/output/greeting.txt"
  content  = <<-EOT
    Hello from Terraform, pet name: ${random_pet.lab.id}
    Tags: ${jsonencode(var.greeting_tags)}
  EOT
}

# No attribute of docker_container.web is referenced below, so Terraform has
# nothing to infer an order from — depends_on forces this to wait until the
# container resource is created.
resource "local_file" "deploy_marker" {
  filename = "${path.module}/output/deployed.txt"
  content  = "container ${var.container_name}-${random_pet.lab.id} deployed\n"

  depends_on = [docker_container.web]
}

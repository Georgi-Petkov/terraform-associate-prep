resource "random_pet" "lab" {
  length = 2
}

resource "local_file" "greeting" {
  filename = "${path.module}/output/${var.container_name}/greeting.txt"
  content  = <<-EOT
    Hello from Terraform, pet name: ${random_pet.lab.id}
    Container label: ${local.container_label}
    Port class: ${local.port_class}
    Owner: ${local.safe_owner}
    Tags: ${local.tag_summary}
    Registry token (should be hidden in plan): ${var.registry_auth_token}
  EOT
}
resource "local_file" "collaborate" {
  filename = "${path.module}/output/${var.container_name}/collaborate.txt"
  content  = <<-EOT
  Terraform allows you to collaborate on your infrastructure with its remote state backends. When you use HCP Terraform (free for up to five users), you can securely share your state with your teammates, provide a stable environment for Terraform to run in, and prevent race conditions when multiple people make configuration changes at once.

You can also connect HCP Terraform to version control systems (VCSs) like GitHub, GitLab, and others, allowing it to automatically propose infrastructure changes when you commit configuration changes to VCS. This lets you manage changes to your infrastructure through version control, as you would with application code.
EOT

  depends_on = [docker_container.web]
}
resource "local_file" "animal_img_link" {
  for_each = { for item in var.animal_img_link : item.filename => item }

  filename = "${path.module}/output/${var.container_name}/${each.value.filename}.txt"
  content  = each.value.content
}
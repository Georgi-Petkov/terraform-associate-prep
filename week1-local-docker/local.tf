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

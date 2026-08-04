output "pet_name" {
  value = random_pet.lab.id
}

output "greeting_file_path" {
  value = local_file.greeting.filename
}

output "container_url" {
  value = "http://localhost:${var.container_port} (container: ${docker_container.web.name})"
}

locals {
  # format() - printf-style string building
  container_label = format("%s-%s", upper(var.container_name), random_pet.lab.id)

  # conditional (ternary) expression - HCL's only "if"
  port_class = var.container_port < 10000 ? "low-range" : "high-range"

  # coalesce() - first non-null value; guards a missing map key
  safe_owner = coalesce(lookup(var.greeting_tags, "owner", null), "unassigned")

  # for expression + join() - map -> readable string
  tag_summary = join(", ", [for k, v in var.greeting_tags : "${k}=${v}"])
}

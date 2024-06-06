variable "input_variable" {
  default = {
    "commentaire 1" = "LOTR",
    "commentaire 2" = "INCEPTION",
    "commentaire 3" = "Bruce Lee"
  }
}

resource "null_resource" exo3 {
    for_each = var.input_variable
    triggers = {
        foo = each.value
    }
    provisioner "local-exec" {
        command = "echo ' ${each.value} => ${each.key}' >> film.txt"
    }
}

output "outpurt_exo3" {
  value = "Exo3 fini"
}
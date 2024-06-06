variable "film_name" {
  type = string
  description = "Input variable to be written to film.txt"
}

variable "file_name" {
  type = string
  description = "nom du fichier"
}

resource "null_resource" "exemple" {
    provisioner "local-exec" {
        command = "echo '${var.film_name}' >> ${var.file_name}"
    }
}

resource "null_resource" "name" {
    provisioner "local-exec" {
      command = "echo '${null_resource.exemple.id}'"
    }
}
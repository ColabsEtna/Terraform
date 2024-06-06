variable "film" {
  type = string
  description = "Input variable to be written to film.txt"
  default  = "Inception"
}

variable "file_name" {
  type = string
  description = "nom du fichier"
  default  = "film.txt"
}

resource "null_resource" "exo1" {
    provisioner "local-exec" {
        command = "echo '${var.film}' >> ${var.file_name}"
    }
}
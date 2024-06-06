variable "movie_name" {
    type = string
    default  = "LOTR"
}

resource "null_resource" exo2 {
    triggers = {
        test = var.movie_name
    }
    provisioner "local-exec" {
        command = "echo '${var.movie_name}' >> film.txt"
    }
}

output "fin_exo2" {
  value = "Exo2 fini, fichier crée!"
}
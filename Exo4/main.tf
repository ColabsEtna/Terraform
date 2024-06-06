variable "input_variable" {
  type = list(string)
  description = "value"
  default = ["tutu", "toto", "test"]
}
 
resource "null_resource" exo4 {
    count = length(var.input_variable)
    provisioner "local-exec" {
        command = "echo '${element(var.input_variable, count.index)}' >> film.txt"
    }
}

output "outpurt_exo4" {
  value = "Exo4 fini"
}
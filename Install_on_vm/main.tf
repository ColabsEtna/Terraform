variable "ip_vm" {
    type = string
    default = "13.51.233.108"
}

variable "user" {
    type = string
    default = "ec2-user"
}

variable "password" {
  type = string
}

resource "null_resource" "example" {

  provisioner "remote-exec" {
    connection {
      type        = "ssh"
      host        = var.ip_vm
      user        = var.user
      password    = var.password
      timeout     = "2m"
    }
    inline = [ 
      "echo tutu > DEMO.txt",
      "echo mdp | sudo -S command"
    ]
  }
}
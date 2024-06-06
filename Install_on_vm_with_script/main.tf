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
  default = "Lockout1515"
}

resource "null_resource" "example" {

    connection {
      type        = "ssh"
      host        = var.ip_vm
      user        = var.user
      password    = var.password
      timeout     = "2m"
    }

    provisioner "file" {
      source = "./script.sh"
      destination = "/tmp/script.sh"
    }

    provisioner "remote-exec" {
    
    inline = [ 
      "sudo mv /tmp/script.sh ./",
      "sudo chmod 777 ./script.sh",
      "./script.sh",
      "docker --version",
      "docker run hello-world"
    ]
  }
}
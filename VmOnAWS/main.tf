

resource "aws_key_pair" "key_exemple" {
  key_name = ""
  public_key = file()
}
resource "aws_instance" "example" {
  ami           = "ami-0c55b159cbfafe1f0" // L'ID de l'AMI Linux que vous souhaitez utiliser
  instance_type = "t2.micro" // Le type d'instance que vous souhaitez utiliser

  tags = {
    Name = "exemple-instance"
  }

  // Paramètres pour se connecter à l'instance
  key_name      = aws_key_pair.key_exemple.key_name
  security_groups = ["votre-groupe-de-securite"]
}

// Remote exec pour provisionner la VM
resource "null_resource" "remote_exec_exemple" {

  provisioner "remote-exec" {
    connection {
      type     = "ssh"
      user     = "votre-username"
      private_key = file("chemin vers ma clé privée")
      host     = aws_instance.example.public_ip // ou aws_instance.example.public_dns
    }

    inline = [
      "votre-commande-1",
      "votre-commande-2",
    ]
  }
}

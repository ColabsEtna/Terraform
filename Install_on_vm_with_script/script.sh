touch tutu.txt
sudo yum update
sudo yum search docker
sudo yum info docker
sudo yum -y install docker
sudo usermod -a -G docker ec2-user
sudo systemctl enable docker.service
sudo systemctl start docker.service
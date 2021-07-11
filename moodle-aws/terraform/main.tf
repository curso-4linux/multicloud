provider "aws" {
   region = var.region
}

resource "aws_instance" "moodle" {
  ami 		= var.ami
  instance_type = var.instance_type
  subnet_id 	= var.subnet_id
  vpc_security_group_ids = [ var.vpc_security_group_ids ]
  key_name = var.key_name
  user_data = file("files/webserver-moodle-install.sh")

  tags = {
    Name        = var.name
    Provisioner = "Terraform"
  }

}

resource "aws_instance" "bastion" {
  ami                    = var.ami_id
  instance_type          = var.bastion_instance_type
  key_name               = var.key_name
  subnet_id              = var.public_subnet_id
  vpc_security_group_ids = [var.bastion_sg_id]

  tags = {
    Name = "Bastion Host"
  }

  provisioner "file" {
    source      = var.key_file_path
    destination = "/home/ubuntu/CommonKey.pem"
  }

  provisioner "remote-exec" {
    inline = [
      "chmod 400 /home/ubuntu/CommonKey.pem"
    ]
  }

  connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = file(var.key_file_path)
    host        = self.public_ip
  }
}

# psql Instances
resource "aws_instance" "psql_instance_1" {
  ami                    = var.ami_id
  instance_type          = var.psql_instance_type
  subnet_id              = var.private_subnet_1_id
  vpc_security_group_ids = [var.private_sg_id]
  key_name               = var.key_name
  tags = {
    Name = "psql-instance-1"
    Role = "psql"
  }
}
resource "aws_instance" "psql_instance_2" {
  ami                    = var.ami_id
  instance_type          = var.psql_instance_type
  subnet_id              = var.private_subnet_1_id
  vpc_security_group_ids = [var.private_sg_id]
  key_name               = var.key_name
  tags = {
    Name = "psql-instance-2"
    Role = "psql"
  }
}
resource "aws_instance" "psql_instance_3" {
  ami                    = var.ami_id
  instance_type          = var.psql_instance_type
  subnet_id              = var.private_subnet_1_id
  vpc_security_group_ids = [var.private_sg_id]
  key_name               = var.key_name
  tags = {
    Name = "psql-instance-3"
    Role = "psql"
  }
}
resource "aws_instance" "psql_instance_4" {
  ami                    = var.ami_id
  instance_type          = var.psql_instance_type
  subnet_id              = var.private_subnet_2_id
  vpc_security_group_ids = [var.private_sg_id]
  key_name               = var.key_name
  tags = {
    Name = "psql-instance-4"
    Role = "psql"
  }
}
resource "aws_instance" "psql_instance_5" {
  ami                    = var.ami_id
  instance_type          = var.psql_instance_type
  subnet_id              = var.private_subnet_2_id
  vpc_security_group_ids = [var.private_sg_id]
  key_name               = var.key_name
  tags = {
    Name = "psql-instance-5"
    Role = "psql"
  }
}
resource "aws_instance" "psql_instance_6" {
  ami                    = var.ami_id
  instance_type          = var.psql_instance_type
  subnet_id              = var.private_subnet_2_id
  vpc_security_group_ids = [var.private_sg_id]
  key_name               = var.key_name
  tags = {
    Name = "psql-instance-6"
    Role = "psql"
  }
}


output "instance_ids" {
  value = aws_instance.bastion.id
}

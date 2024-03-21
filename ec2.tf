locals {
  public_subnet_id  = module.vpc.public_subnets[0]
  private_subnet_id = module.vpc.private_subnets[0]
  key_name          = "pubkey"
}

data "aws_ami" "latest_amazon_linux_2" {
  most_recent = true
  filter {
    name   = "name"
    values = ["*amzn2-ami-hvm*"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
  filter {
    name   = "architecture"
    values = ["arm64"]
  }
  owners = ["amazon"]
}



resource "aws_key_pair" "ssh" {
  key_name   = local.key_name
  public_key = file("./pubkey/id_rsa.pub")

  tags = var.tags
}

module "ec2_instance" {

  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 3.0"

  name = "single-instance"

  create_spot_instance = true
  spot_price           = "0.60"
  spot_type            = "persistent"

  user_data = file("./user_data/script.sh")

  ami                    = data.aws_ami.latest_amazon_linux_2.id
  instance_type          = var.instance-size
  key_name               = local.key_name
  vpc_security_group_ids = [aws_security_group.sg.id]
  subnet_id              = local.public_subnet_id
  tags                   = var.tags
}


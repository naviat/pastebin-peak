terraform {
  required_version = ">= 1.3.7"
  backend "s3" {
    bucket = "inc.devr.terraform"
    key    = "terraform.state"
    region = "ap-southeast-1"
  }
}

provider "aws" {
  region = var.aws_region
}

# Create a basic network for the environment. VPC, Subnet, Security groups, IGW etc
module "aws_basic_network" {
  source = "./modules/aws_basic_network"

  aws_core_vpc_cidr       = var.vpc_cidr
  aws_core_subnet_cidr1   = var.subnet_cidr
  aws_core_az_1           = var.aws_availability_zone
  additional_public_cidrs = var.additional_cidrs

  owner_tag       = var.own_tag
  environment_tag = var.env_tag
  prefix_tag      = var.pre_tag
}

module "aws_key_pair" {
  source = "./modules/aws_key_pair"

  aws_core_public_key_file = var.pub_key_file
  aws_core_public_key_name = var.pub_key_name
}

module "aws_iam_access_key" {
  source = "./modules/aws_iam_access_key"

  aws_iam_user_name = module.aws_iam_user.aws_user_name

}

resource "aws_instance" "jenkins_instance" {
  ami                    = data.aws_ami.ubuntu.id
  count                  = var.server_count
  instance_type          = "t2.medium"
  subnet_id              = module.aws_basic_network.aws_subnet_id
  vpc_security_group_ids = ["${module.aws_basic_network.aws_default_sg_id}"]
  key_name               = var.pub_key_name

  root_block_device {
    volume_size = "10"
  }

  connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = file("~/.ssh/${var.private_key_file}")
    host        = self.public_ip
  }

  provisioner "remote-exec" {
    inline = [
      "aws configure set aws_access_key_id ${module.aws_iam_access_key.aws_user_key_id}",
      "aws configure set aws_secret_access_key ${module.aws_iam_access_key.aws_user_key_secret}",
      "exit 0"
    ]
  }

  provisioner "remote-exec" {
    inline = [
      "ssh-keygen -b 2048 -t rsa -f ~/.ssh/devr -q -N \"\""
    ]
  }

  tags = {
    Name        = "${var.pre_tag}_JENKINS_${count.index + 1}"
    Owner       = "${var.own_tag}"
    Environment = "${var.env_tag}"
  }
}

module "aws_iam_user" {
  source = "./modules/aws_iam_user"

  aws_iam_user_name = "devr_user"
  aws_iam_user_path = "/"
  environment_tag   = var.env_tag
  owner_tag         = var.own_tag
  prefix_tag        = var.pre_tag

}

module "aws_iam_user_policy" {

  source              = "./modules/aws_iam_user_policy"
  aws_iam_policy_file = file("./modules/aws_iam_user_policy/policy/devr.json")
  aws_iam_policy_name = "DEVR-POLICY"
  aws_iam_user_name   = module.aws_iam_user.aws_user_name

}


data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"]

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }
}


resource "null_resource" "ConfigureAnsibleLabelVariable" {
  provisioner "local-exec" {
    command = "echo [${var.dev_host_label}:vars] > hosts"
  }
  provisioner "local-exec" {
    command = "echo ansible_ssh_user=ubuntu >> hosts"
  }
  provisioner "local-exec" {
    command = "echo ansible_ssh_private_key_file=${var.ssh_key_path} >> hosts"
  }
  provisioner "local-exec" {
    command = "echo [${var.dev_host_label}] >> hosts"
  }
}

resource "null_resource" "ProvisionRemoteHostsIpToAnsibleHosts" {
  count = "${var.server_count}"
  connection {
    type = "ssh"
    user = "ubuntu"
    host = "${element(aws_instance.jenkins_instance.*.public_ip, count.index)}"
    private_key = "${file("${var.ssh_key_path}")}"
  }
  provisioner "remote-exec" {
    inline = [
      "sudo apt update -y"
    ]
  }
  provisioner "local-exec" {
    command = "echo ${element(aws_instance.jenkins_instance.*.public_ip, count.index)} >> hosts"
  }
}

resource "null_resource" "ModifyApplyAnsiblePlayBook" {
  provisioner "local-exec" {
    command = "sed -i -e '/hosts:/ s/: .*/: ${var.dev_host_label}/' play.yml" #change host label in playbook dynamically
  }

  provisioner "local-exec" {
    command = "sleep 15;ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -i hosts play.yml"
  }
  depends_on = [null_resource.ProvisionRemoteHostsIpToAnsibleHosts]
}
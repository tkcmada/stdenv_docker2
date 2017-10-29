variable "region" {
    default = "ap-northeast-1"
}
 
variable "images" {
    default = {
        us-east-1 = "ami-1ecae776"
        us-west-2 = "ami-e7527ed7"
        us-west-1 = "ami-d114f295"
        eu-west-1 = "ami-a10897d6"
        eu-central-1 = "ami-a8221fb5"
        ap-southeast-1 = "ami-68d8e93a"
        ap-southeast-2 = "ami-fd9cecc7"
        ap-northeast-1 = "ami-cbf90ecb"
        sa-east-1 = "ami-b52890a8"
    }
}

provider "aws" {
    region = "${var.region}"
}

resource "aws_vpc" "myVPC" {
    cidr_block = "10.1.0.0/16"
    instance_tenancy = "default"
    enable_dns_support = "true"
    enable_dns_hostnames = "false"
    tags {
      Name = "myVPC"
    }
}

resource "aws_subnet" "public-a" {
    vpc_id = "${aws_vpc.myVPC.id}"
    cidr_block = "10.1.1.0/24"
    availability_zone = "ap-northeast-1b"
}

resource "aws_security_group" "admin" {
    name = "admin"
    description = "Allow SSH inbound traffic"
    vpc_id = "${aws_vpc.myVPC.id}"
    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
}

resource "aws_instance" "cm-test" {
    ami = "${var.images["ap-northeast-1"]}"
    instance_type = "t2.micro"
    key_name = "devec2"
    vpc_security_group_ids = [
      "${aws_security_group.admin.id}"
    ]
    subnet_id = "${aws_subnet.public-a.id}"
    associate_public_ip_address = "true"
    root_block_device = {
      volume_type = "gp2"
      volume_size = "20"
    }
    ebs_block_device = {
      device_name = "/dev/sdf"
      volume_type = "gp2"
      volume_size = "100"
    }
    tags {
        Name = "cm-test"
    }
}

output "public ip of cm-test" {
  value = "${aws_instance.cm-test.public_ip}"
}

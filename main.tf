provider "aws" {
  region     = "${var.aws_region}"
}

resource "terraform_remote_state" "sample" {
  backend = "s3"
  config {
    bucket = "${var.bucket}"
    key = "${var.key}"
    region = "${var.aws_region}"
  }
}

resource "aws_security_group" "terra_Sg"{
  name        = "allow_all"
  description = "Allow all inbound traffic"
  vpc_id      = "${var.VPCId}"
  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }

  tags {
    Name = "baseline"
  }
}




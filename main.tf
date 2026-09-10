provider "aws" {
  region = "ap-south-2"
}

resource "aws_instance" "one" {
  count                  = 3
  ami                    = "ami-0cf604dc5b650b194"
  instance_type          = "t2.medium"
  key_name               = "junks"
  vpc_security_group_ids = ["sg-09e73ad7cd9f3e81f"]
  tags = {
    Name = var.instance_names[count.index]
  }
}

variable "instance_names" {
  default = ["jenkins", "tomcat-1", "Monitoring server"]
}

resource "aws_s3_bucket" "one" {
  bucket = "my-project-bucket-12360089"
  versioning {
    enabled = true
  }
}

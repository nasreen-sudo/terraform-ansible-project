provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "web" {
  count = 3
  ami = "ami-0f5e8a042c8bfcd5e"    # Ubuntu 22.04
  instance_type = "t2.micro"

  tags = {
    Name = "webserver-dev"
    Role = "webserver"    # Ansible uses this tag
    Env  = "dev"
  }
}

resource "aws_instance" "example" {
  ami           = data.aws_ami.example.id
  instance_type = "t3.micro"

  tags = {
    Name = "HelloWorld"
  }
}


data "aws_ami" "example" {
  # executable_users = ["amazon"]
  most_recent = true
  # name_regex       = "^myami-[0-9]{3}"
  owners = ["amazon"]

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }

  filter {
    name   = "name"
    values = ["al2023-ami-2023*-kernel-6.12-x86_64"]
  }

  #   filter {
  #     name   = "platform"
  #     values = ["Linux/UNIX"]
  #   }

  #   filter {
  #     name   = "name"
  #     values = ["al2023-ami"]
  #   }
}

output "test2" {
  value = data.aws_ami.example.id

}
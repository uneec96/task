resource "aws_instance" "Task" {
  count          = var.instance_count
  ami            = var.ami
  instance_type  = var.instance_type

  tags = {
      Name  = "Task ${count.index}"
      
    }
}

resource "aws_ebs_volume" "example" {
  availability_zone = "ap-south-1a"
  count = 3
  size              = 8
}

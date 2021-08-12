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
  size              = 8
}

resource "aws_volume_attachment" "ebs_att1" {
  device_name = "/dev/sdh"
  volume_id   = "${aws_ebs_volume.example.id}"
  instance_id = "${aws_instance.Task[0].id}"
}
resource "aws_volume_attachment" "ebs_att2" {
  device_name = "/dev/sdh"
  volume_id   = "${aws_ebs_volume.example.id}"
  instance_id = "${aws_instance.Task[1].id}"
}
resource "aws_volume_attachment" "ebs_att3" {
  device_name = "/dev/sdh"
  volume_id   = "${aws_ebs_volume.example.id}"
  instance_id = "${aws_instance.Task[2].id}"
}

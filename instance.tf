# created EC2 instances

resource "aws_instance" "example" {
  ami                    = var.image_id
  instance_type          = var.instance_type
  key_name               = aws_key_pair.demo-key.key_name
  vpc_security_group_ids = ["${aws_security_group.allow_tls.id}"]

  tags = {
    Name = "first-instance"
  }

  user_data = file("${path.module}/script.sh")
}


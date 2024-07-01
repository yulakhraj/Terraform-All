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

# files, local-exec, remote-exec
connection {
  type        = "ssh"
  user        = "ubuntu"
  private_key = file("${path.module}/abc-key")
  host        = self.public_ip
}

provisioner "file" {
  source      = "commands.txt"
  destination = "/tmp/commands.txt"
}

provisioner "file" {
  content     = "Hi i am manish, i am learning terrafomr"
  destination = "/tmp/content.md"
}

provisioner "local-exec" {
  command = "echo ${self.public_ip} > instance_ip.txt"

}

}
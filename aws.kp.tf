# created Key-Pair

resource "aws_key_pair" "demo-key" {
  key_name   = "demo-key"
  public_key = file("${path.module}/abc-key.pub")
}
# output "key_name" {
#   value = "${aws_key_pair.demo-key.key_name}"
# }
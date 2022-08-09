resource "aws_instance" "this" {
  ami           = "ami-0e040c48614ad1327"
  instance_type = "t2.micro"
}
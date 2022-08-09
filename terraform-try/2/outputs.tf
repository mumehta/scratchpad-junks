output "domain-name" {
  value = aws_instance.web.public_dns
}

output "public-ip" {
  value = aws_instance.web.public_ip
}


output "application-url" {
  value = "${aws_instance.web.public_dns}/index.php"
}

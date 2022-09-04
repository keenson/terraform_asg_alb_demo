
resource "aws_launch_configuration" "web" {
  name_prefix = "web-"

  image_id      = "ami-0947d2ba12ee1ff75"
  instance_type = var.instance_type
  key_name      = "terraform-demo"

  security_groups             = [aws_security_group.allow_http.id]
  associate_public_ip_address = true

  user_data = <<-EOF
              #!/bin/bash
              yum update -y
              yum install -y httpd
              echo " This is a demo instance " > /var/www/html/index.html
              systemctl start httpd
              EOF
  lifecycle {
    create_before_destroy = true
  }
}













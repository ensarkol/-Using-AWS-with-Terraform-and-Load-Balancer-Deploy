resource "aws_launch_configuration" "example" {
  image_id        = "ami-0e83be366243f524a"
  instance_type   = "t2.micro"
  security_groups = [aws_security_group.instance.id]
  key_name = "terraform"
  user_data = <<-EOF
              #!/bin/bash
              echo "Hello, World" > index.html
              nohup busybox httpd -f -p 8080 &
              EOF
}
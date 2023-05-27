variable "aws_region" {
  description = "AWS Region"
  default = "eu-central-1"
}

variable "instance_type" {
  description = "Instance type to launch"
  default = "t2.micro"
}

variable "grafana_port" {
  description = "Port to expose Grafana on"
  default = "3000"
}

variable "ssh_port" {
  description = "Port for SSH"
  default = "22"
}

variable "http_port" {
  description = "Port for HTTP"
  default = "80"
}

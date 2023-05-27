variable "aws_region" {
  description = "AWS Region"
  default = "eu-central-1"
}

variable "instance_type" {
  description = "Instance type to launch"
  default = "t2.micro"
}

variable "key_name" {
  description = "Name of the SSH key pair"
}

variable "public_key_path" {
  description = "Public key to be used for the instance"
}

variable "grafana_port" {
  description = "Port to expose Grafana on"
  default = "3000"
}

variable "ssh_port" {
  description = "Port for SSH on"
  default = "22"
}

variable "AWS_ACCESS_KEY_ID" {
  description = "AWS Access Key"
  type        = string
}

variable "AWS_SECRET_ACCESS_KEY" {
  description = "AWS Secret Key"
  type        = string
}

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
  description = "Port for SSH on"
  default = "22"
}

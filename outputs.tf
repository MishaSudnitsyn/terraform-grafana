output "instance_id" {
  value = aws_instance.grafana_server.id
}

output "public_ip" {
  value = aws_eip.grafana_eip.public_ip
}

output "security_group_id" {
  value = aws_security_group.grafana_sg.id
}
provider "aws" {
  access_key = var.AWS_ACCESS_KEY_ID
  secret_key = var.AWS_SECRET_ACCESS_KEY
  region     = var.aws_region
}

resource "aws_key_pair" "deployer" {
  key_name   = "ec2-sshkey"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQC9A6SRrRDfxeuaSoHebbDOiUYAa9lEc7njIg5P1MzLf3WDw75flZ0Yug690/HeQ/d5HiE/i7CDy4F9mPuTL22zIifgdMDHAfqO4XuK18G3xxK5mlL46oIY41LS3trSKGKawbygCpGdCDcAzpjLRtd6XC/mCqPCjiSEMHVJa7/kpe44OSdES0IQgWKN1PXzxSiW22Ky7XWYwsxMi+lTTS/ZQkpmwqBfDiAGw2q0PQ0o9xsmIu8O8WfngN/Yca3REOF4rzMlIqlSatUeF7pvJK804C0kAybacPhsnnrpK+qg513BBK6HInSvZmW1ecPrsswDhENAeJqSb0PAzrLSARJkshTQT96m+Ai8k3b7vrtzjxGkmCAVrTZ+O7R1JU1Ucnl16q/BpiyC1KUXSTlMcb3TAdxJnpxvz0nj8nMvf5ypcpw2+1JGRXOHOZwXLm5NGb5+VYFfyn3wg0tDdDYzi+RYiZyPQOltx4PULvmhqTwtTXlXXWfzi9+ptm439KuZhvsSAZCrhgY+BDbtlJZ3FE5qR2XzbdrPo98TD5RDc/tUTqOPZ5iSTWNDFR6wtyzwk70JyOTKYbiF6qu+aqCMKRyJ4qxNoPU7dMcfe+FoKcOtilsdOYmSp+dzeuGuWw+qXekowz86Cch0K9LWCZkZWJOCG3KTGC/on60Sy85PveYQ2w== mail@test.com"
}

resource "aws_instance" "grafana_server" {
  ami                    = "ami-0ab1a82de7ca5889c"
  instance_type          = var.instance_type
  key_name               = aws_key_pair.deployer.key_name
  vpc_security_group_ids = [aws_security_group.grafana_sg.id]

  user_data = <<-EOF
              #!/bin/bash
              sudo apt-get update
              sudo apt-get install ca-certificates curl gnupg
              sudo install -m 0755 -d /etc/apt/keyrings
              curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
              sudo chmod a+r /etc/apt/keyrings/docker.gpg
              echo "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
              sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
              docker run -d -p 3000:3000 grafana/grafana-oss
              EOF

  tags = {
    Name = "grafana_server"
  }
}

resource "aws_eip" "grafana_eip" {
  domain   = "vpc"
  instance = aws_instance.grafana_server.id
}

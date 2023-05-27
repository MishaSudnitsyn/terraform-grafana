# Grafana server on AWS EC2 Instance using Iac Terraform

This Terraform onfiguration allows you to easily provision an AWS EC2 instance, creates an SSH key pair, assigns a Elastic IP to the instance, , and configure the necessary security group rules as well as sets up Docker and Grafana.

## Purpose

The purpose of this Terraform code is to automate the deployment of an Grafana on AWS. It provisions the required resources, such as an EC2 instance, Elastic IP, and security group, and configures them to enable secure connectivity.

## Prerequisites

- Terraform installed
- AWS account credentials with appropriate permissions

## Usage

1. Clone this repository to your local machine.
2. Configure the AWS provider in the providers.tf file by specifying the desired AWS region.
3. Customize the Terraform variables in the `variables.tf` file as needed.
4. Run terraform init to initialize the Terraform configuration.
5. Run terraform apply to provision the OpenVPN server infrastructure on AWS.

## Resources Created

The Terraform configuration creates the following resources:

- EC2 instance for the Grafana
- Elastic IP and association with the EC2 instance
- Security group with inbound rules for SSH and port 3000
- Key pair for SSH connection to the EC2 instance

## Clean Up

To remove all the created resources and clean up your AWS environment, run terraform destroy after you are done using the OpenVPN server.
For detailed usage instructions and further customization options, please refer to the Terraform documentation.


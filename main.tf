# List Provider Type
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}


# Configure the AWS Provider
provider "aws" {
  region = var.aws_default_region
}

# Create and name resource 
resource "aws_transfer_server" "test_server2" {
  tags = {
    Name = var.aws_transfer_family_server
  }
  endpoint_type=var.aws_endpoint_type
  security_policy_name=var.aws_security_policy_name
  identity_provider_type=var.aws_identity_provider_type
  domain=var.aws_domain
  pre_authentication_login_banner=var.aws_pre_authentication_login_banner
  post_authentication_login_banner=var.aws_post_authentication_login_banner
  protocols=var.aws_protocols
}

resource "aws_iam_role" "test_server2" {
  name = var.aws_transfer_user

  assume_role_policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
        "Effect": "Allow",
        "Principal": {
            "Service": "transfer.amazonaws.com"
        },
        "Action": "sts:AssumeRole"
        }
    ]
}
EOF
}


resource "aws_transfer_user" "sftp_user" {
  server_id = aws_transfer_server.test_server2.id
  user_name = var.aws_transfer_user
  role      = aws_iam_role.test_server2.arn

  home_directory=var.aws_home_directory
}

resource "aws_transfer_ssh_key" "test_server2" {
  server_id = aws_transfer_server.test_server2.id
  user_name = aws_transfer_user.sftp_user.user_name
  body      = var.TF_VAR_SSH_KEY_PUB

}


variable "aws_transfer_family_server" {
  type=string
  default="cb_test_server"
  description="The name of the transer family server to be created"
  nullable=false
# validation {
#    condition     = length(var.aws_transfer_family_server) > 4 && substr(var.image_id, 0, 4) == "ami-"
#    error_message = "The image_id value must be a valid AMI id, starting with \"ami-\"."
#  }
}

variable "aws_default_region" {
  type=string
  default="us-east-1"
}

variable "aws_transfer_user" {
  type=string
  default="sftp_user"
}

variable "aws_transfer_user_role" {
  type=string
}

variable "aws_home_directory" {
  type=string
}

variable "aws_endpoint_type" {
  type=string
  default="PUBLIC" 
}

variable "aws_security_policy_name" {
  type=string
  default="TransferSecurityPolicy-2020-06"
}

variable "aws_identity_provider_type" {
  type=string
  default="SERVICE_MANAGED"
}

variable "aws_domain" {
  type=string
  default= "S3"
}
  
variable "aws_pre_authentication_login_banner" {
  type=string
  default="Please show me some credentials 2 \n"
}

variable "aws_post_authentication_login_banner" {
  type=string
  default="Cool Cool, welcome"
}

variable "aws_protocols" {
  type=list(string)
  default=["SFTP"]
}

variable "TF_VAR_SSH_KEY_PUB" {
  type=string
}
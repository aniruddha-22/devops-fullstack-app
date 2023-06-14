variable "aws_region" {
  description = "AWS region"
  default     = "ap-south-1"
}

variable "CI_CD_ami" {
  description = "AMI ID for CI_CD_instance"
  default     = "ami-03cb1380eec7cc118"
}

variable "CI_CD_instance_type" {
  description = "Instance type for CI_CD_instance"
  default     = "t2.medium"
}

variable "ec2_key_name" {
  description = "EC2 key pair name"
  default     = "test"
}

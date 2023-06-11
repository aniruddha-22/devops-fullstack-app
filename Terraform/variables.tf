variable "aws_region" {
  description = "AWS region"
  default     = "ap-south-1"
}

variable "jenkins_ami" {
  description = "AMI ID for Jenkins instance"
  default     = "ami-049a62eb90480f276"
}

variable "jenkins_instance_type" {
  description = "Instance type for Jenkins instance"
  default     = "t2.micro"
}

variable "minikube_ami" {
  description = "AMI ID for Minikube instance"
  default     = "ami-049a62eb90480f276"
}

variable "minikube_instance_type" {
  description = "Instance type for Minikube instance"
  default     = "t2.medium"
}

variable "ec2_key_name" {
  description = "EC2 key pair name"
  default     = "test"
}

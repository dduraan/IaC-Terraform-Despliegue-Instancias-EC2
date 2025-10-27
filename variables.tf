variable "region" {
  description = "AWS region"
  default     = "eu-south-2"
}


variable "ami_id" {
  description = "AMI ID para la EC2"
  default     = "ami-030b0fc4a70f87a7a"
}

variable "instance_type" {
  description = "Tipo de instancia"
  default     = "t4g.small"
}

variable "vpc_cidr" {
  description = "CIDR de la VPC"
  default     = "10.0.0.0/16"
}

variable "subnet_cidr" {
  description = "CIDR de la subred"
  default     = "10.0.1.0/24"
}

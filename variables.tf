variable "aws_region" {
  description = "AWS region to deploy resources"
  default     = "ap-south-1"
}

variable "project" {
  description = "Project name"
  default     = "narendra-vpc"
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  description = "CIDR block for the public subnet"
  default     = "10.0.1.0/24"
}

variable "az" {
  description = "Availability Zone"
  default     = "ap-south-1a"
}

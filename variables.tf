variable "aws_region" {
  description = "AWS region to deploy resources"
  type        = string
  default     = "ap-south-1"
  validation {
    condition     = can(regex("^([a-z]{2}-[a-z]+-\\d)$", var.aws_region))
    error_message = "AWS region must be in the format 'xx-xxxx-x'."
  }
}

variable "project" {
  description = "Project name (used for resource naming)"
  type        = string
  default     = "narendra-vpc"
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
  validation {
    condition     = can(regex("^([0-9]{1,3}\\.){3}[0-9]{1,3}/[0-9]+$", var.vpc_cidr))
    error_message = "VPC CIDR must be a valid CIDR block."
  }
}

variable "public_subnet_cidr" {
  description = "CIDR block for the public subnet"
  type        = string
  default     = "10.0.1.0/24"
  validation {
    condition     = can(regex("^([0-9]{1,3}\\.){3}[0-9]{1,3}/[0-9]+$", var.public_subnet_cidr))
    error_message = "Subnet CIDR must be a valid CIDR block."
  }
}

variable "az" {
  description = "Availability Zone for the public subnet"
  type        = string
  default     = "ap-south-1a"
}

variable "environment" {
  description = "Deployment environment (e.g., dev, staging, prod)"
  type        = string
  default     = "prod"
  validation {
    condition     = contains(["dev", "staging", "prod"], var.environment)
    error_message = "Environment must be one of: dev, staging, prod."
  }
}

variable "owner" {
  description = "Owner or team responsible for the resources"
  type        = string
  default     = "narendra"
}

variable "admin_ip" {
  description = "Public IP CIDR allowed for SSH and ICMP (e.g., '203.0.113.0/32')"
  type        = string
  default     = "0.0.0.0/0"
  validation {
    condition     = can(regex("^([0-9]{1,3}\\.){3}[0-9]{1,3}/[0-9]+$", var.admin_ip))
    error_message = "Admin IP must be a valid CIDR block."
  }
}

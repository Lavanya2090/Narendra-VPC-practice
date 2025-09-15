## Requirements
# VPC Terraform Module

This Terraform module provisions a **basic AWS VPC** setup with:
- A VPC with DNS support enabled
- Public Subnet
- Internet Gateway
- Route Table and association
- Default Security Group (SSH + ICMP allowed from admin IP)
- VPC Flow Logs to CloudWatch

---

## 📦 Usage


module "vpc" {
  source = "github.com/Lavanya2090/vpc-module" # Or relative path: ./vpc-module

  aws_region         = "ap-south-1"
  project            = "demo-vpc"
  vpc_cidr           = "10.1.0.0/16"
  public_subnet_cidr = "10.1.1.0/24"
  az                 = "ap-south-1b"
  environment        = "staging"
  owner              = "lavanya"
  admin_ip           = "203.0.113.25/32"
}

---

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 5.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.100.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_cloudwatch_log_group.vpc_flow_logs](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_group) | resource |
| [aws_flow_log.vpc](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/flow_log) | resource |
| [aws_iam_role.vpc_flow_logs_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.vpc_flow_logs_attach](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_internet_gateway.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/internet_gateway) | resource |
| [aws_route_table.public](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table) | resource |
| [aws_route_table_association.public_assoc](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) | resource |
| [aws_security_group.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_subnet.public](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_vpc.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_admin_ip"></a> [admin\_ip](#input\_admin\_ip) | Public IP CIDR allowed for SSH and ICMP (e.g., '203.0.113.0/32') | `string` | `"0.0.0.0/0"` | no |
| <a name="input_aws_region"></a> [aws\_region](#input\_aws\_region) | AWS region to deploy resources | `string` | `"ap-south-1"` | no |
| <a name="input_az"></a> [az](#input\_az) | Availability Zone for the public subnet | `string` | `"ap-south-1a"` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | Deployment environment (e.g., dev, staging, prod) | `string` | `"prod"` | no |
| <a name="input_owner"></a> [owner](#input\_owner) | Owner or team responsible for the resources | `string` | `"narendra"` | no |
| <a name="input_project"></a> [project](#input\_project) | Project name (used for resource naming) | `string` | `"narendra-vpc"` | no |
| <a name="input_public_subnet_cidr"></a> [public\_subnet\_cidr](#input\_public\_subnet\_cidr) | CIDR block for the public subnet | `string` | `"10.0.1.0/24"` | no |
| <a name="input_vpc_cidr"></a> [vpc\_cidr](#input\_vpc\_cidr) | CIDR block for the VPC | `string` | `"10.0.0.0/16"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_security_group_id"></a> [security\_group\_id](#output\_security\_group\_id) | n/a |
| <a name="output_subnet_id"></a> [subnet\_id](#output\_subnet\_id) | n/a |
| <a name="output_vpc_flow_log_group"></a> [vpc\_flow\_log\_group](#output\_vpc\_flow\_log\_group) | n/a |
| <a name="output_vpc_id"></a> [vpc\_id](#output\_vpc\_id) | Outputs |

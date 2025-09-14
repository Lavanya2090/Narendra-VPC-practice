# Makefile for Narendra-VPC-practice
# -------------------
# Terraform commands
# -------------------

# Initialize Terraform
init:
	@terraform init

# Format Terraform code
fmt:
	@terraform fmt

# Validate Terraform configuration
validate:
	@terraform validate

# Plan Terraform deployment
plan:
	@terraform fmt
	@terraform validate
	@terraform plan -out=tfplan

# Apply Terraform plan saved in tfplan (run plan if tfplan does not exist)
apply:
	@if not exist tfplan ( \
		echo tfplan not found. Running make plan first... & \
		make plan \
	)
	@terraform apply -auto-approve tfplan

# Destroy Terraform resources
destroy:
	@terraform destroy -auto-approve

# Generate/update README.md using terraform-docs
docs:
	@terraform-docs markdown . > README.md

# Full deploy: init → fmt → validate → plan → apply → docs → push
deploy:
	@terraform init
	@terraform fmt
	@terraform validate
	@terraform plan -out=tfplan
	@terraform apply -auto-approve tfplan
	@terraform-docs markdown . > README.md
	@git add README.md
	@git commit -m "Update README.md with terraform-docs"
	@git push origin HEAD

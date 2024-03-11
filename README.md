# Setup
This repository houses a Terraform module required for setting up Otterize in your infrastructure using Terraform, on Azure IAM.

To use this Terraform module, see the Terraform Registry: https://registry.terraform.io/modules/otterize/otterize-azure-iam/azure/latest


## Local Development
1. Clone the repository
2. Run `terraform init`
3. On changing files run `terraform fmt` + `terraform validate`
4. To test the changes run `terraform apply -var-file=terraform.tfvars`
5. To destroy the changes run `terraform destroy -var-file=terraform.tfvars`
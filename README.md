Automated EC2 Deployment with Terraform

This project automates the deployment of an EC2 instance on AWS using Terraform. It includes installing dependencies (like Java 21), cloning a GitHub repository, deploying a web app, and scheduling shutdowns to control costs.

---

🚀 Features

- Spin up EC2 instances based on stage (Dev, Prod)
- Install Java 21 on the instance
- Clone and deploy app from GitHub
- Open port 80 for HTTP access
- Verify app is reachable
- Configurable via stage-specific files

---

🔧 Prerequisites

- AWS account with free-tier access
- AWS CLI configured
- Terraform installed
- SSH key pair
- Git

---

⚙ Configuration

Use dev_config.tfvars or prod_config.tfvars to set:

hcl
instance_type = "t2.micro"
github_repo   = "https://github.com/techeazy-consulting/techeazy-devops"
stage         = "dev"
subnet_id     = "subnet-xxxxxxx"


---

📁 File Structure


├── main.tf
├── variables.tf
├── outputs.tf
├── dev_config.tfvars
├── prod_config.tfvars
├── scripts/
│   └── user_data.sh
└── README.md


---

📦 Deployment Steps

1. Initialize Terraform:
   
   terraform init
   

2. Plan the deployment:
   ```
   terraform plan -var-file="dev_config.tfvars"
   

3. Apply the deployment:
   
   terraform apply -var-file="dev_config.tfvars"
   

4. Destroy (when done):
   
   terraform destroy -var-file="dev_config.tfvars"
   ```

---

🔐 Security

- AWS credentials must be set in your environment
- Do not hardcode any secrets in the code

---

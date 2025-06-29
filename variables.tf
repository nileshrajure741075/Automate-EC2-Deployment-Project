variable "stage" {
  description = "Deployment stage: dev or prod"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro"
}

variable "repo_url" {
  description = "GitHub repo to clone"
  type        = string
  default     = "https://github.com/techeazy-consulting/techeazy-devops"
}

variable "region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "ami_id" {
  description = "AMI ID for Ubuntu"
  type        = string
  default     = "ami-0731becbf832f281e" # Ubuntu 22.04 (Free Tier) in us-east-1
}

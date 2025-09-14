#Terraform Infrastructure 

A simple Terraform project to create AWS VPC and EC2 instance with proper networking setup.

## What This Creates

- **VPC** with CIDR block `10.0.0.0/16`
- **Internet Gateway** for public internet access
- **Public Subnet** with auto-assign public IP enabled
- **Route Table** with internet gateway route
- **Security Group** allowing SSH access (port 22)
- **EC2 Instance** (t2.micro) in the public subnet

## Prerequisites

- [Terraform](https://www.terraform.io/downloads.html) installed
- [AWS CLI](https://aws.amazon.com/cli/) configured
- AWS Access Key and Secret Key
- SSH Key Pair in AWS

## 📁 Project Structure

<img width="302" height="260" alt="image" src="https://github.com/user-attachments/assets/58fdd818-7e0f-4f3a-8fb0-f183916e533a" />

## Usage

1. **Clone the repository**
   ```bash
   git clone https://github.com/MahammadYakub/Terraform-Infra.git/master
   cd Terraform-Infra

2. **Configure AWS credentials**
   
    # Option 1: Environment variables
    export AWS_ACCESS_KEY_ID="your_access_key"
    export AWS_SECRET_ACCESS_KEY="your_secret_key"
    export AWS_REGION="ap-south-1"
    
    # Option 2: terraform.tfvars file (create it)
    aws_region    = "ap-south-1"
    instance_type = "t2.micro"
    instance_name = "terraform-instance"
    key_name      = "your-key-pair-name"
    ami_id        = "ami-0f5ee92e2d63afc18" # Amazon Linux 2 in ap-south-1

3.  **Initialize and deploy**
    terraform init      # Initialize Terraform
    terraform plan      # Preview changes
    terraform apply     # Deploy infrastructure



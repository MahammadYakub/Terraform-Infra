
# Terraform Infrastructure 

A simple Terraform project to create AWS VPC and EC2 instance with proper networking setup.

##  What This Creates

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

```
Terraform-Infra/
├── main.tf          # Main Terraform configuration
├── variables.tf     # Variable definitions
├── terraform.tfvars # Variable values (gitignored)
├── .gitignore       # Git ignore rules
└── README.md        # This file
```

## Usage

1. **Clone the repository**
   ```bash
   git clone https://github.com/MahammadYakub/Terraform-Infra.git
   cd Terraform-Infra
   ```

2. **Configure AWS credentials**
   ```bash
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
   ```

3. **Initialize and deploy**
   ```bash
   terraform init      # Initialize Terraform
   terraform plan      # Preview changes
   terraform apply     # Deploy infrastructure
   ```

4. **Connect to the instance**
   ```bash
   ssh -i your-key.pem ec2-user@$(terraform output -raw public_ip)
   ```

5. **Destroy infrastructure**
   ```bash
   terraform destroy   # Clean up resources
   ```

##  Outputs

After deployment, Terraform will output:
- VPC ID
- Public Subnet ID  
- EC2 Instance Public IP
- SSH connection command

## Security Notes

- Never commit `terraform.tfvars` or `.tfstate` files to version control
- The `.gitignore` file prevents accidental commits of sensitive files
- Security group allows SSH from anywhere (0.0.0.0/0) - restrict this in production

## Customization

Edit `variables.tf` to modify:
- AWS region
- Instance type
- AMI ID
- VPC CIDR block
- Subnet CIDR blocks

## Troubleshooting

### SSH Connection Issues
1. Ensure key pair exists in AWS
2. Check security group allows port 22
3. Verify instance has public IP
4. Wait for instance to complete initialization

### Terraform Errors
1. Run `terraform validate` to check syntax
2. Ensure AWS credentials are properly configured

## 🤝 Contributing

Feel free to fork this repository and submit pull requests for improvements.

## 📄 License

MIT License - see LICENSE file for details
```

**To use this:**
1. Create a new file called `README.md` in your project
2. Copy-paste the entire content above
3. Save the file
4. Commit and push to GitHub:
```bash
git add README.md
git commit -m "Add README documentation"
git push origin main
```

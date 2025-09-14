variable "aws_region" {
  description = "AWS region to deploy resources"
  type = string
  default = "ap-south-1"
}

variable "instance_type" {
    description = "EC2 instance type"
    type = string
    default = "t2..micro"
  
}

variable "ami_id" {
    description = "ami id"
    type = string
    default = "ami-02d26659fd82cf299"
}

variable "instance_name" {
  description = "name"
  type = string
  default = "second-terraform"

}

variable "key_name" {
  description = "key pair name"
  type = string
  default = "terraform"
}
 
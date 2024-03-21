variable "region" {
  type        = string
  default     = "us-east-1"
  description = "AWS region to deploy to"
}

variable "public-vpc-name" {
  type        = string
  default     = "public-vpc"
  description = "Public VPC name"
}


variable "instance-size" {
  type        = string
  default     = "t2.micro"
  description = "Instance size - default t2.micro"
}

variable "tags" {
  description = "tags to add to resources"
}

variable "user_email" {
  description = "User email to subscribe the SNS topic to"
}

variable "s3_bucket_name" {
  description = "S3 bucket for Terraform state and miscellaneous items"
}

variable "user_subnet" {
  description = "User defined subnet to allow SSH "
}
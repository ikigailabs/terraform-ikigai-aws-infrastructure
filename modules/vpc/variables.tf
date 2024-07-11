variable "aws_region" {
  type        = string
  description = "AWS region"
}

variable "vpc_cidr" {
  type        = string
  description = "CIDR block for the Ikigai VPC"
  default     = "16.0.0.0/16"
}

variable "vpc_name" {
  type        = string
  description = "Name for the Ikigai VPC"
  default     = "ikigai-vpc"
}

variable "availability_zone_1" {
  type        = string
  description = "First of two availability zones for subnet distribution"
}

variable "availability_zone_2" {
  type        = string
  description = "Second of two availability zones for subnet distribution"
}

variable "private_subnet_1_name" {
  type        = string
  description = "Name of Ikigai private subnet 1"
  default     = "private-1"
}

variable "private_subnet_1_cidr" {
  type        = string
  description = "CIDR of Ikigai private subnet 1"
  default     = "16.0.32.0/19"
}

variable "private_subnet_2_name" {
  type        = string
  description = "Name of Ikigai private subnet 2"
  default     = "private-2"
}

variable "private_subnet_2_cidr" {
  type        = string
  description = "CIDR of Ikigai private subnet 2"
  default     = "16.0.64.0/19"
}

variable "public_subnet_1_name" {
  type        = string
  description = "Name of Ikigai public subnet 1"
  default     = "public-1"
}

variable "public_subnet_1_cidr" {
  type        = string
  description = "CIDR of Ikigai public subnet 1"
  default     = "16.0.1.0/24"
}

variable "public_subnet_2_name" {
  type        = string
  description = "Name of Ikigai public subnet 2"
  default     = "public-2"
}

variable "public_subnet_2_cidr" {
  type        = string
  description = "CIDR of Ikigai public subnet 2"
  default     = "16.0.2.0/24"
}

variable "rds_subnet_1_name" {
  type        = string
  description = "Name of Ikigai rds subnet 1"
  default     = "rds-1"
}

variable "rds_subnet_1_cidr" {
  type        = string
  description = "CIDR of Ikigai rds subnet 1"
  default     = "16.0.3.0/24"
}

variable "rds_subnet_2_name" {
  type        = string
  description = "Name of Ikigai rds subnet 2"
  default     = "rds-2"
}

variable "rds_subnet_2_cidr" {
  type        = string
  description = "CIDR of Ikigai rds subnet 2"
  default     = "16.0.4.0/24"
}

variable "nat_subnet_name" {
  type        = string
  description = "Name of Ikigai nat subnet"
  default     = "subnet-nat"
}

variable "nat_subnet_cidr" {
  type        = string
  description = "CIDR of Ikigai nat subnet)"
  default     = "16.0.5.0/24"
}

variable "vpc_security_group_name" {
  type        = string
  description = "Name of Ikigai VPC security group for intra-VPC traffic"
  default     = "vpc-security-group"
}

variable "vpn_security_group_name" {
  type        = string
  description = "Name of Ikigai VPC security group for vpn traffc"
  default     = "vpn-security-group"
}

variable "nat_gateway_name" {
  type        = string
  description = "Name of Ikigai VPC nat gateway"
  default     = "nat-gateway"
}

variable "internet_gateway_name" {
  type        = string
  description = "Name of Ikigai VPC internet gateway"
  default     = "internet-gateway"
}

variable "vpn_gateway_name" {
  type        = string
  description = "Name of Ikigai VPC vpn gateway"
  default     = "vpn-gateway"
}

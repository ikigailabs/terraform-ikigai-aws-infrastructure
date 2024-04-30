output "vpc_id" {
  value       = aws_vpc.prod.id
  description = "The ID of the VPC that Elasticsearch, EKS, and RDS will live in"
}

output "private_subnet_1_id" {
  value = aws_subnet.private_1.id
  description = "The first private subnet which will host the EKS and Elasticsearch clusters"
}

output "private_subnet_2_id" {
  value = aws_subnet.private_2.id
  description = "The second private subnet which will host the EKS and Elasticsearch clusters"
}

output "rds_subnet_1_id" {
  value = aws_subnet.rds_1.id
  description = "The first subnet which will host the RDS servers"
}

output "rds_subnet_2_id" {
  value = aws_subnet.rds_2.id
  description = "The second subnet which will host the RDS servers"
}

output "vpc_security_group_id" {
  value = aws_security_group.prod-vpc.id
  description = "The VPC security group for allowing intra-VPC traffic"
}

output "vpn_security_group_id" {
  value = aws_security_group.prod-vpn.id
  description = "The VPC securty group for allowing traffic from a VPN"
}
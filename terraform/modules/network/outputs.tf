output "vpc_id" {
  description = "VPC ID"
  value = aws_vpc.main.id
}

output "public_subnets" {
  description = "List of Public Subnet IDs"
  value = aws_subnet.public[*].id
}

output "private_subnets" {
  description = "List of Private Subnet IDs"
  value = aws_subnet.private[*].id
}

output "internet_gateway" {
  description = "Internet Gateway ID"
  value = aws_internet_gateway.main.id
}

output "nat_gateway" {
  description = "Nat Gateway ID"
  value = aws_nat_gateway.main[*].id
}
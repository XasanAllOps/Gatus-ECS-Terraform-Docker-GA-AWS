# -- CHILD NETWORK MODULE 🔑 --

#-- PUBLIC 🟩 🌍 --#
data "aws_availability_zones" "available" {
  state = "available"

  filter {
    name   = "opt-in-status"
    values = ["opt-in-not-required"]
  }
}

locals {
  azs        = slice(data.aws_availability_zones.available.names, 0, min(3, length(data.aws_availability_zones.available.names)))
  az_mapping = { for idx, az in local.azs : az => idx }
}

resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr
  tags = {
    Environment = "${var.environment}-vpc"
  }
}

resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "${var.environment}-internet-gateway"
  }
}

resource "aws_subnet" "public" {
  for_each                = local.az_mapping
  availability_zone       = each.key
  vpc_id                  = aws_vpc.main.id
  cidr_block              = cidrsubnet(var.vpc_cidr, 8, each.value + 1)
  map_public_ip_on_launch = true

  tags = {
    Name = "public-subnet #${each.key}"
  }
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main.id
  }

  tags = {
    Name = "(${var.environment}): public-route-table"
  }
}

resource "aws_route_table_association" "public" {
  for_each       = aws_subnet.public
  subnet_id      = each.value.id
  route_table_id = aws_route_table.public.id
}

resource "aws_nat_gateway" "main" {
  availability_mode = "regional"
  vpc_id            = aws_vpc.main.id
  depends_on        = [aws_internet_gateway.main]
}

#-- PRIVATE 🟦 🔐 --#
resource "aws_subnet" "private" {
  for_each          = local.az_mapping
  vpc_id            = aws_vpc.main.id
  cidr_block        = cidrsubnet(var.vpc_cidr, 8, each.value + 10)
  availability_zone = each.key

  tags = {
    Name = "private-subnet #${each.key}"
  }
}

resource "aws_route_table" "private" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.main.id
  }

  tags = {
    Name = "(${var.environment}): private-route-table"
  }
}

resource "aws_route_table_association" "private" {
  for_each       = aws_subnet.private
  subnet_id      = each.value.id
  route_table_id = aws_route_table.private.id
}

resource "aws_vpc_endpoint" "s3" {
  vpc_id          = aws_vpc.main.id
  service_name    = "com.amazonaws.${var.region}.s3"
  route_table_ids = [aws_route_table.private.id]

  tags = {
    Name = "(${var.environment}): s3-vpc-endpoint"
  }
}
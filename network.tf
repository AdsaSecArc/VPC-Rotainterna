resource "aws_vpc" "developer" {
  cidr_block           = "10.0.0.0/16"
  instance_tenancy     = "default"
  enable_dns_hostnames = "true"

  tags = {
    Name = "desenvolvedor-vpc"
  }
}

resource "aws_subnet" "Private-1A" {
  vpc_id            = aws_vpc.developer.id
  availability_zone = "us-east-2a"
  cidr_block        = "10.0.32.0/24"

  tags = {
    Name = "PrivateSubnet-1A"
  }
}

resource "aws_subnet" "Private-1B" {
  vpc_id            = aws_vpc.developer.id
  availability_zone = "us-east-2b"
  cidr_block        = "10.0.64.0/24"

  tags = {
    Name = "PrivateSubnet-1B"
  }
}

resource "aws_route_table" "RT-Private" {
  vpc_id = aws_vpc.developer.id

  route = []

  tags = {
    Name = "Developer"
  }
}

resource "aws_route_table_association" "RTPrivate_1A" {
  subnet_id      = aws_subnet.Private-1A.id
  route_table_id = aws_route_table.RT-Private.id
}

resource "aws_route_table_association" "RTPrivate_1B" {
  subnet_id      = aws_subnet.Private-1B.id
  route_table_id = aws_route_table.RT-Private.id
}


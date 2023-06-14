resource "aws_vpc" "fullstack_vpc" {
  cidr_block = "172.16.0.0/16"

  tags = {
    Name = "vpc for fullstack app"
  }
}

resource "aws_subnet" "fullstack_subnet" {
  vpc_id            = aws_vpc.fullstack_vpc.id
  cidr_block        = "172.16.10.0/24"
  availability_zone = "ap-south-1a"

  tags = {
    Name = "subnet for fullstack app"
  }
}

resource "aws_security_group" "CI_CD_sg" {
  name        = "CI_CD-security-group"
  description = "Security group for CI_CD_instance"
  vpc_id      = aws_vpc.fullstack_vpc.id

  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

    ingress {
    from_port   = 3000
    to_port     = 3000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_internet_gateway" "fullstack_igw" {
  vpc_id = aws_vpc.fullstack_vpc.id

  tags = {
    Name = "fullstack-app-igw"
  }
}

resource "aws_route_table" "fullstack_public_rt" {
  vpc_id = aws_vpc.fullstack_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.fullstack_igw.id
  }

  tags = {
    Name = "fullstack-public-rt"
  }
}

resource "aws_route_table_association" "fullstack_subnet_association" {
  subnet_id      = aws_subnet.fullstack_subnet.id
  route_table_id = aws_route_table.fullstack_public_rt.id
}

resource "aws_instance" "CI_CD_instance" {
  ami                         = var.CI_CD_ami
  instance_type               = var.CI_CD_instance_type
  key_name                    = var.ec2_key_name
  subnet_id                   = aws_subnet.fullstack_subnet.id
  associate_public_ip_address = true
  vpc_security_group_ids      = [aws_security_group.CI_CD_sg.id]

  tags = {
    Name = "CI_CD_instance"
  }
}
provider "aws" {
region   = "us-east-1"
access_key = "AKIAVOOIFZ46ZNYCG7AR"
secret_key = "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"
}

 resource "aws_vpc" "main" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "main"
  }
}

resource "aws_vpc" "Bam-vpc" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "Bam-vpc"
  }
}

resource "aws_internet_gateway" "Bam-igw" {
  vpc_id = aws_vpc.Bam-vpc.id

  tags = {
    Name = "Bam-igw"
  }
}

resource "aws_internet_gateway" "main-igw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "main-igw"
  }
}


resource "aws_subnet" "main-public" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "Main-public"
  }
}

resource "aws_subnet" "Bam-public" {
  vpc_id     = aws_vpc.Bam-vpc.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "Bam-public"
  }
}
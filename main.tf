provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "demo" {
  ami = "ami-0ec0e125bb6c6e8ec"
  instance_type = "t2.micro"
  subnet_id = aws_subnet.pubsub1.id
}

resource "aws_db_instance" "dbdemo" {
  allocated_storage = 20
  instance_class = "db.t3.micro"
  db_name = "demodb"
  username = "admin"
  password = "admin"
  engine = "mysql"
}

resource "aws_vpc" "myvpc1" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_subnet" "pubsub1" {
  vpc_id = aws_vpc.myvpc1.id
  cidr_block = "10.0.0.0/28"
  map_public_ip_on_launch = true
  tags= {
    Name="pubsub1"
  }
}

resource "aws_subnet" "pubsub2" {
  vpc_id = aws_vpc.myvpc1.id
  cidr_block = "10.0.0.48/28"
  map_public_ip_on_launch = true
  tags= {
    Name="pubsub1"
  }
}

resource "aws_subnet" "prisub1" {
  vpc_id = aws_vpc.myvpc1.id
  cidr_block = "10.0.0.96/28"
  tags= {
    Name="prisub1"
  }
}

resource "aws_subnet" "prisub2" {
  vpc_id = aws_vpc.myvpc1.id
  cidr_block = "10.0.0.128/28"
  tags= {
    Name="prisub2"
  }
}

resource "aws_route_table" "privatesubnetable" {
  vpc_id = aws_vpc.myvpc1.id
  tags = {
    Name="privatesubnetable"
  }
}

resource "aws_route_table" "publicsubnettable" {
  vpc_id = aws_vpc.myvpc1.id
  tags = {
    Name="publicsubnettable"
  }
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.aws_internet.id
  }
}

resource "aws_route_table_association" "ta1" {
  subnet_id = aws_subnet.pubsub1.id
  route_table_id = aws_route_table.publicsubnettable.id
}
resource "aws_route_table_association" "ta2" {
  subnet_id = aws_subnet.pubsub2.id
  route_table_id = aws_route_table.publicsubnettable.id
}

resource "aws_route_table_association" "ta3" {
  subnet_id = aws_subnet.prisub1.id
  route_table_id = aws_route_table.privatesubnetable.id
}

resource "aws_route_table_association" "ta4" {
  subnet_id = aws_subnet.prisub2.id
  route_table_id = aws_route_table.privatesubnetable.id
}


resource "aws_internet_gateway" "aws_internet" {

}

resource "aws_internet_gateway_attachment" "aws_internet_gateway" {
  internet_gateway_id = aws_internet_gateway.aws_internet.id
  vpc_id = aws_vpc.myvpc1.id
}
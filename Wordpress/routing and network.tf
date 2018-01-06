# Declare the data source
data "aws_availability_zones" "available" {}

/* EXTERNAL NETWORG , IG, ROUTE TABLE */
resource "aws_internet_gateway" "gw" {
   vpc_id = "${aws_vpc.terraformmain.id}"
    tags {
        Name = "internet gw terraform generated"
    }
}
resource "aws_route_table" "routepublic" {
  vpc_id = "${aws_vpc.terraformmain.id}"
  tags {
      Name = "routePublic"
  }
  route {
        cidr_block = "0.0.0.0/0"
        gateway_id = "${aws_internet_gateway.gw.id}"
    }
}
resource "aws_route_table" "routeprivate1" {
  vpc_id = "${aws_vpc.terraformmain.id}"
  tags {
      Name = " routeprivate1"
  }
  route {
        cidr_block = "0.0.0.0/0"
        nat_gateway_id = "${aws_nat_gateway.Public1AZA.id}"
  }
}

resource "aws_route_table" "routeprivate2" {
  vpc_id = "${aws_vpc.terraformmain.id}"
  tags {
      Name = " routeprivate2"
  }
  route {
        cidr_block = "0.0.0.0/0"
        nat_gateway_id = "${aws_nat_gateway.Public2AZB.id}"
  }
}

resource "aws_eip" "forNat" {
    vpc      = true
}
resource "aws_nat_gateway" "NATPublic1AZA" {
    allocation_id = "${aws_eip.forNat.id}"
    subnet_id = "${aws_subnet.Public1AZA.id}"
    depends_on = ["aws_internet_gateway.gw"]
}

resource "aws_nat_gateway" "NATPublic2AZB" {
    allocation_id = "${aws_eip.forNat.id}"
    subnet_id = "${aws_subnet.Public2AZB.id}"
    depends_on = ["aws_internet_gateway.gw"]
}


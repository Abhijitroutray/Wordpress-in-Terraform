resource "aws_subnet" "Public1AZA" {   # Associate subnet to Specific AZ
  vpc_id = "${aws_vpc.terraformmain.id}"
  cidr_block = "${var. Subnet-Public1-AzA-CIDR}"
  map_public_ip_on_launch = true
  tags {
        Name = "Public1AZA"
  }
 availability_zone = "${data.aws_availability_zones.available.names[0]}"
}
resource "aws_route_table_association" "Public1AZA" {
    subnet_id = "${aws_subnet.Public1AZA.id}"
    route_table_id = "${aws_route_table.routepublic.id}"
}

resource "aws_subnet" "Public2AZB" {   # Associate subnet to Specific AZ
  vpc_id = "${aws_vpc.terraformmain.id}"
  cidr_block = "${var. Subnet-Public2-Azb-CIDR}"
  map_public_ip_on_launch = true
  tags {
        Name = "Public2AZB"
  }
 availability_zone = "${data.aws_availability_zones.available.names[1]}"
}
resource "aws_route_table_association" "Public2AZB" {
    subnet_id = "${aws_subnet.Public2AZB.id}"
    route_table_id = "${aws_route_table.routepublic.id}"
}






resource "aws_subnet" "Private1AZA" {   # Associate subnet to Specific AZ
  vpc_id = "${aws_vpc.terraformmain.id}"
  cidr_block = "${var. Subnet-Private1-AzA-CIDR}"
  tags {
        Name = "Private1AZA"
  }
  availability_zone = "${data.aws_availability_zones.available.names[0]}"
}
resource "aws_route_table_association" "Private1AZA" {
    subnet_id = "${aws_subnet.Private1AZA.id}"
    route_table_id = "${aws_route_table.routeprivate1.id}"
}

resource "aws_subnet" "Private2AZB" {   # Associate subnet to Specific AZ
  vpc_id = "${aws_vpc.terraformmain.id}"
  cidr_block = "${var. Subnet-Private2-Azb-CIDR}"
  tags {
        Name = "Private2AZB"
  }
  availability_zone = "${data.aws_availability_zones.available.names[1]}"
}
resource "aws_route_table_association" "Private2AZB" {
    subnet_id = "${aws_subnet.Private2AZB.id}"
    route_table_id = "${aws_route_table.routeprivate2.id}"
}


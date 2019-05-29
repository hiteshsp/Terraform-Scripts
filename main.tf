provider "aws"{}
resource "aws_instance" "Jenkins" {
	ami = "${var.instance["ami"]}"
	instance_type = "${var.instance["instance_type"]}"
	tags = {
	  Name = "${var.instance["Name"]}"
	}
	key_name = "${var.instance["key_name"]}"
	subnet_id = "${var.instance["subnet_id"]}"
	vpc_security_group_ids=["${aws_security_group.JenkinsSG.id}"]
}
resource "aws_security_group" "JenkinsSG"{
	name = "${var.security_group["name"]}"
	description = "${var.security_group["description"]}"
	ingress {
	    from_port   = "${var.security_group["port"]}"
	    to_port     = "${var.security_group["port"]}"
	    protocol    = "tcp"
	    cidr_blocks = ["${var.security_group["cidr_block_inbound"]}"]
	  }
        egress {
	  from_port   = 0
	  to_port     = 0
	  protocol    = "-1"
	  cidr_blocks = ["${var.security_group["cidr_block_outbound"]}"]
	}
  tags = {
    Name = "${var.security_group["name"]}"
  }
}

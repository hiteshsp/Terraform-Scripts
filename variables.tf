variable "instance" {
	type = "map"
	default = {
	}
}
variable "vpc_id" {
	type = "string"
	default = "vpc-0dacf36a"
}
variable "security_group"{
	type = "map"
	default = {}

}

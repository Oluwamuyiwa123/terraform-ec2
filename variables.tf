variable "aws_region" {
  default = "us-east-1"
}

variable "ami_id" {
  description = "AMI to use"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "subnet_id" {
  description = "Subnet to launch the instance in"
}

variable "security_group_ids" {
  type        = list(string)
  description = "Security groups to attach to the instance"
}

variable "key_name" {
  description = "SSH key name"
}

variable "instance_name" {
  description = "Tag name for the instance"
}

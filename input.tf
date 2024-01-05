# Creating inputs
variable "specific_region" {
  type    = string
  default = "ap-south-1"
  description= "creating a instance in a specific region"
}

variable "instance_type" {
  type    = string
  default = "t3.micro"
  description= "defining the instance type"
}

variable "ami_type" {
  type    = string
  default = "ami-0a7cf821b91bcccbc"
  description= "defining the type of ami"
}

variable "cidr_blocks" {
  type    = list(string)
  default = ["10.0.0.0/27","10.0.0.0/28","10.0.0.16/28"]
  description= "defining the cidr block"
}

variable "hostnames" {
  type    = list(string)
  default = ["false","true"]
  description= "enabling or disabling the hostnames"
}

variable "mapping_ip" {
  type    = list(string)
  default = ["false","true"]
  description= "mapping ip on launch"
}

variable "default_cidr_blocks" {
  type    = list(string)
  default = ["0.0.0.0/0"]
  description= "this is the default cidr block"
}

variable "key_name" {
  type    = string
  default = "Sample"
  description= "this is the default cidr block"
}

variable "jenkins_security_groups" {
  description = "Input list"
  type        = list(string)
  default     = ["22", "80", "8080"]
}
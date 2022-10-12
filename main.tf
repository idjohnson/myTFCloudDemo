terraform {
  cloud {
    organization = "ThePrincessKing"
    workspaces {
      name = "myTFexampleCLI"
    }
  }
}


provider "aws" {
    region = "us-west-1"
}

resource "aws_instance" "web" {
  instance_type = "t2.micro"
  ami = "ami-02ef5566632e904f8"
}

resource "aws_autoscaling_group" "my_asg" {
  availability_zones        = ["us-west-1a"]
  name                      = "my_asg"
  max_size                  = 70
  min_size                  = 50
  health_check_grace_period = 300
  health_check_type         = "ELB"
  desired_capacity          = 50
  force_delete              = true
  launch_configuration      = "my_web_config"
}

resource "aws_launch_configuration" "my_web_config" {
    name = "my_web_config"
    image_id = "ami-02ef5566632e904f8"
    instance_type = "t2.micro"
}

resource "aws_autoscaling_group" "my_asg2" {
  availability_zones        = ["us-west-1b"]
  name                      = "my_asg"
  max_size                  = 70
  min_size                  = 50
  health_check_grace_period = 300
  health_check_type         = "ELB"
  desired_capacity          = 50
  force_delete              = true
  launch_configuration      = "my_web_config"
}


resource "aws_autoscaling_group" "my_asg3" {
  availability_zones        = ["us-west-1c"]
  name                      = "my_asg"
  max_size                  = 70
  min_size                  = 50
  health_check_grace_period = 300
  health_check_type         = "ELB"
  desired_capacity          = 50
  force_delete              = true
  launch_configuration      = "my_web_config"
}


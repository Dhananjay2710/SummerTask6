provider "aws" {
   region=var.region
   access_key=var.access_key
   secret_key=var.secret_key
}

resource "aws_instance" "os1"{
   ami=var.img_id
   availability_zone=var.az
   instance_type=var.instance_type
   tags={
      Name="Task6_WebApplication"
   }
}

output "os1"{
	value=aws_instance.os1.availability_zone
}

resource "aws_ebs_volume" "Task6_volume" {
	availability_zone = var.az
	size = 1
	tags = {
	Name = "task6_webapplication_volume"
	}
}

resource "aws_volume_attachment" "vol_attach"{
	device_name = "/dev/sdh"
	volume_id = aws_ebs_volume.Task6_volume.id
	instance_id= aws_instance.os1.id
}


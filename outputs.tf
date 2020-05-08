output "subnet1" {
  value = "${aws_subnet.subnet1-public.id}"
}

output "subnet2" {
  value = "${aws_subnet.subnet2-public.id}"
}

output "subnet3" {
  value = "${aws_subnet.subnet3-public.id}"
}

output "subnet4" {
  value = "${aws_subnet.subnet4-public.id}"
}

output "sgroup" {
  value = "${aws_security_group.allow_all.id}"
}



output "jenkins_url" {
  description = "URL(s) of the Jenkins instance"
  value       = formatlist("http://%s:%s", aws_instance.jenkins_instance.*.public_ip, "8080")
}

output "securitygroup_id" {
  description = "Security Group ID"
  value       = module.aws_basic_network.aws_default_sg_id
}

output "subnet_id" {
  description = "Subnet ID"
  value       = module.aws_basic_network.aws_subnet_id
}

output "public_ip" {
  description = "IP pública de la instancia EC2"
  value       = aws_instance.web.public_ip
}

output "public_dns" {
  description = "DNS público de la instancia EC2"
  value       = aws_instance.web.public_dns
}
output "CI_CD_public_ip" {
  value = aws_instance.CI_CD_instance.public_ip
}
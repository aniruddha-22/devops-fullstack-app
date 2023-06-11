output "jenkins_public_ip" {
  value = aws_instance.jenkins_instance.public_ip
}

output "minikube_public_ip" {
  value = aws_instance.minikube_instance.public_ip
}

output "alb_dns_name" {
  value = aws_lb.app.dns_name
}

output "alb_arn_suffix" {
  value = aws_lb.app.arn_suffix
}

output "autoscaling_group_name" {
  value = aws_autoscaling_group.app.name
}

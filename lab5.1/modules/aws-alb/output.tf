output "alb_dns_name" {
    description = "the dns name of the lb"
    value       = try(aws_lb.web-elb.dns_name)
}
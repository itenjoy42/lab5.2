# VPC
REGION           = "ap-northeast-1"
AZ_1             = "ap-northeast-1a"
AZ_2             = "ap-northeast-1c"

VPC-NAME         = "Three-Tier-VPC"
VPC-CIDR         = "10.0.0.0/16"
IGW-NAME         = "Three-Tier-Interet-Gateway"
PUBLIC-CIDR1     = "10.0.1.0/24"
PUBLIC-SUBNET1   = "Three-Tier-Public-Subnet1"
PUBLIC-CIDR2     = "10.0.2.0/24"
PUBLIC-SUBNET2   = "Three-Tier-Public-Subnet2"
WEB-CIDR1    = "10.0.3.0/24"
WEB-SUBNET1  = "Three-Tier-Web-Subnet1"
WEB-CIDR2    = "10.0.4.0/24"
WEB-SUBNET2  = "Three-Tier-Web-Subnet2"
APP-CIDR1    = "10.0.5.0/24"
APP-SUBNET1  = "Three-Tier-APP-Subnet1"
APP-CIDR2    = "10.0.6.0/24"
APP-SUBNET2  = "Three-Tier-APP-Subnet2"
# DB-CIDR1    = "10.0.7.0/24"
# DB-SUBNET1  = "Three-Tier-DB-Subnet1"
# DB-CIDR2    = "10.0.8.0/24"
# DB-SUBNET2  = "Three-Tier-DB-Subnet2"

EIP-NAME1        = "Three-Tier-Elastic-IP1"
EIP-NAME2        = "Three-Tier-Elastic-IP2"

NGW-NAME1        = "Three-Tier-NAT1"
NGW-NAME2        = "Three-Tier-NAT2"
PUBLIC-RT-NAME1  = "Three-Tier-Public-Route-table1"
PUBLIC-RT-NAME2  = "Three-Tier-Public-Route-table2"
PRIVATE-RT-NAME1 = "Three-Tier-Private-Route-table1"
PRIVATE-RT-NAME2 = "Three-Tier-Private-Route-table2"

# SECURITY GROUP
WEB-ALB-SG-NAME = "Three-Tier-web-alb"
APP-ALB-SG-NAME = "Three-Tier-app-alb"
WEB-SG-NAME = "Three-Tier-web-sg"
APP-SG-NAME = "Three-Tier-app-sg"
# DB-SG-NAME  = "Three-Tier-db-sg"
# DB-SUBNET-GROUP-NAME = "Three-Tier-db-subnet-group"

# # RDS
# SG-NAME      = "Three-Tier-rds-sg"
# RDS-USERNAME = "admin"
# RDS-PWD      = "Admin1234"
# # DB-NAME      = "mydb"
# RDS-NAME     = "Three-Tier-RDS"

# ALB
WEB-TG-NAME  = "Web-TG"
APP-TG-NAME  = "APP-TG"
WEB-ALB-NAME = "Web-elb"
APP-ALB-NAME = "APP-elb"


# IAM
IAM-ROLE              = "iam-role-for-ec2-SSM"
IAM-POLICY            = "iam-policy-for-ec2-SSM"
INSTANCE-PROFILE-NAME = "iam-instance-profile-for-ec2-SSM"

# AUTOSCALING
#AMI-NAME             = "New-AMI"
WEB-LAUNCH-TEMPLATE-NAME = "Web-template"
APP-LAUNCH-TEMPLATE-NAME = "APP-template"
WEB-INSTANCE-TYPE        = "t4g.micro"
APP-INSTANCE-TYPE        = "t4g.micro"
WEB-ASG-NAME             = "Three-Tier-WEB-ASG"
APP-ASG-NAME             = "Three-Tier-APP-ASG"


# CLOUDFRONT
DOMAIN-NAME = "ticketjo.shop"
CDN-NAME    = "Three-Tier-CDN"
ALB-NAME    = "Web-elb"

# WAF
WEB-ACL-NAME = "Three-Tier-WAF"

#

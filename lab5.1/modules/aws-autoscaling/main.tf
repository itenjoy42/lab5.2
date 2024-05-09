# Creating Launch template for Web tier AutoScaling Group
resource "aws_launch_template" "Web-LC" {
  name = var.web-launch-template-name
  image_id = data.aws_ami.ami.image_id
  instance_type = var.web-instance-type

  vpc_security_group_ids = [data.aws_security_group.web-sg.id]

  user_data = filebase64("./modules/aws-autoscaling/deploy-for-web.sh")
}


resource "aws_autoscaling_group" "Web-ASG" {
  name = var.web-asg-name
  vpc_zone_identifier  = [data.aws_subnet.web-subnet1.id, data.aws_subnet.web-subnet2.id]
  launch_template {
    id = aws_launch_template.Web-LC.id
    version = aws_launch_template.Web-LC.latest_version

  }
  min_size             = 2
  max_size             = 4
  health_check_type    = "ELB"
  health_check_grace_period = 300
  target_group_arns    = [data.aws_lb_target_group.web-tg.arn]
  force_delete         = true
  tag {
    key                 = "Name"
    value               = "Web-ASG"
    propagate_at_launch = true
  }

}


resource "aws_autoscaling_policy" "web-custom-cpu-policy" {
  name                   = "custom-cpu-policy"
  autoscaling_group_name = aws_autoscaling_group.Web-ASG.id
  adjustment_type        = "ChangeInCapacity"
  scaling_adjustment     = 1
  cooldown               = 60
  policy_type            = "SimpleScaling"
}


resource "aws_cloudwatch_metric_alarm" "web-custom-cpu-alarm" {
  alarm_name          = "custom-cpu-alarm"
  alarm_description   = "alarm when cpu usage increases"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = 2
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = 120
  statistic           = "Average"
  threshold           = "70"

  dimensions = {
    "AutoScalingGroupName" : aws_autoscaling_group.Web-ASG.name
  }
  actions_enabled = true

  alarm_actions = [aws_autoscaling_policy.web-custom-cpu-policy.arn]
}


resource "aws_autoscaling_policy" "web-custom-cpu-policy-scaledown" {
  name                   = "web-custom-cpu-policy-scaledown"
  autoscaling_group_name = aws_autoscaling_group.Web-ASG.id
  adjustment_type        = "ChangeInCapacity"
  scaling_adjustment     = -1
  cooldown               = 60
  policy_type            = "SimpleScaling"
}

resource "aws_cloudwatch_metric_alarm" "web-custom-cpu-alarm-scaledown" {
  alarm_name          = "web-custom-cpu-alarm-scaledown"
  alarm_description   = "alarm when cpu usage decreases"
  comparison_operator = "LessThanOrEqualToThreshold"
  evaluation_periods  = 2
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = 120
  statistic           = "Average"
  threshold           = "50"

  dimensions = {
    "AutoScalingGroupName" : aws_autoscaling_group.Web-ASG.name
  }
  actions_enabled = true

  alarm_actions = [aws_autoscaling_policy.web-custom-cpu-policy-scaledown.arn]
}

###~~~~~~~~~~~~~~~~~~~~~~~~~~~


# Creating Launch template for APP tier AutoScaling Group
resource "aws_launch_template" "APP-LC" {
  name = var.app-launch-template-name
  image_id = data.aws_ami.ami.image_id
  instance_type = var.app-instance-type

  vpc_security_group_ids = [data.aws_security_group.app-sg.id]

  user_data = filebase64("./modules/aws-autoscaling/deploy-for-app.sh")
}


resource "aws_autoscaling_group" "APP-ASG" {
  name = var.app-asg-name
  vpc_zone_identifier  = [data.aws_subnet.app-subnet1.id, data.aws_subnet.app-subnet2.id]
  launch_template {
    id = aws_launch_template.APP-LC.id
    version = aws_launch_template.APP-LC.latest_version

  }
  min_size             = 2
  max_size             = 4
  health_check_type    = "ELB"
  health_check_grace_period = 300
  target_group_arns    = [data.aws_lb_target_group.app-tg.arn]
  force_delete         = true
  tag {
    key                 = "Name"
    value               = "APP-ASG"
    propagate_at_launch = true
  }

}


resource "aws_autoscaling_policy" "app-custom-cpu-policy" {
  name                   = "app-custom-cpu-policy"
  autoscaling_group_name = aws_autoscaling_group.APP-ASG.id
  adjustment_type        = "ChangeInCapacity"
  scaling_adjustment     = 1
  cooldown               = 60
  policy_type            = "SimpleScaling"
}


resource "aws_cloudwatch_metric_alarm" "app-custom-cpu-alarm" {
  alarm_name          = "app-custom-cpu-alarm"
  alarm_description   = "alarm when cpu usage increases"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = 2
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = 120
  statistic           = "Average"
  threshold           = "70"

  dimensions = {
    "AutoScalingGroupName" : aws_autoscaling_group.APP-ASG.name
  }
  actions_enabled = true

  alarm_actions = [aws_autoscaling_policy.app-custom-cpu-policy.arn]
}


resource "aws_autoscaling_policy" "app-custom-cpu-policy-scaledown" {
  name                   = "app-custom-cpu-policy-scaledown"
  autoscaling_group_name = aws_autoscaling_group.APP-ASG.id
  adjustment_type        = "ChangeInCapacity"
  scaling_adjustment     = -1
  cooldown               = 60
  policy_type            = "SimpleScaling"
}

resource "aws_cloudwatch_metric_alarm" "app-custom-cpu-alarm-scaledown" {
  alarm_name          = "app-custom-cpu-alarm-scaledown"
  alarm_description   = "alarm when cpu usage decreases"
  comparison_operator = "LessThanOrEqualToThreshold"
  evaluation_periods  = 2
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = 120
  statistic           = "Average"
  threshold           = "50"

  dimensions = {
    "AutoScalingGroupName" : aws_autoscaling_group.APP-ASG.name
  }
  actions_enabled = true

  alarm_actions = [aws_autoscaling_policy.app-custom-cpu-policy-scaledown.arn]
}
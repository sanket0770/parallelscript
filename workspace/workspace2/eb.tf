terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "eu-west-2"
}




resource "aws_s3_bucket" "bucket" {
  bucket = "terraform-eb-demo-bucket0001111"
}

resource "aws_s3_object" "object" {
  bucket = aws_s3_bucket.bucket.id
  key    = "app-deployment-v1"
  source = "C:\\Users\\sysadmin\\Desktop\\researchapp\\app.zip"
  

  depends_on = [aws_s3_bucket.bucket]
}

resource "aws_elastic_beanstalk_application" "my_app" {
  name = "MyElasticBeanstalkAppsanket0001111"
}

resource "aws_elastic_beanstalk_application_version" "default" {
  name        = "tf-test-version-label"
  application = "MyElasticBeanstalkAppsanket0001111"
  description = "application version created by terraform"
  bucket      = aws_s3_bucket.bucket.id
  key         = aws_s3_object.object.id
}

resource "aws_elastic_beanstalk_environment" "my_environment" {
  name        = "MyEnvironmentsanket0001111"
  application = aws_elastic_beanstalk_application.my_app.name
  solution_stack_name = "64bit Amazon Linux 2 v3.5.9 running Python 3.8"
  version_label = aws_elastic_beanstalk_application_version.default.name

  setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name      = "InstanceType"
    value     = "t2.micro"
  }

  setting {
    namespace = "aws:elasticbeanstalk:environment"
    name      = "EnvironmentType"
    value     = "SingleInstance"
  }

  setting {
    namespace = "aws:elasticbeanstalk:application:environment"
    name      = "PYTHONPATH"
    value     = "/opt/python/current/app:/opt/python/run/venv/lib/python3.8/site-packages"
  }
  
  setting {
      namespace = "aws:autoscaling:launchconfiguration"
      name      = "IamInstanceProfile"
      value     = "aws-elasticbeanstalk-ec2-role"
    }

}


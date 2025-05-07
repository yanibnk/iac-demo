provider "aws" {
  region                      = "us-east-1"
  access_key                  = "test"
  secret_key                  = "test"
  skip_requesting_account_id  = true
  skip_metadata_api_check     = true
  skip_credentials_validation = true
  endpoints {
    ec2 = "http://ip10-0-3-4-d0dgq9805akh4glkf8og-4566.direct.lab-boris.fr"
  }
}

variable "image_id" {
  description = "AMI ID"
  type        = string
}

resource "aws_instance" "demo" {
  ami           = var.image_id
  instance_type = "t2.micro"
}

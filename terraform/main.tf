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

Génère un ID aléatoire à chaque apply (force nouvelle ressource)
resource "random_id" "commit_simulation" {
  keepers = {
    always_change = timestamp() # nouvelle valeur à chaque apply
  }

  byte_length = 4
}

resource "aws_instance" "demo" {
  ami           = "ami-${random_id.commit_simulation.hex}" # fictif mais uniquejbjjkbbijbjkhfftyhfj
  instance_type = "t2.micro"

  tags = {
    Name = "Instance-${random_id.commit_simulation.hex}"
  }

  lifecycle {
    create_before_destroy = true
  }
}

output "created_instance_id" {
  value = aws_instance.demo.id
}

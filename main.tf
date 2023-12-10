terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "5.6.0"
    }
  }
}

resource "time_rotating" "period" {
  rotation_days = 5
}

resource "random_password" "create-password" {
  length           = 10
  upper            = true
  lower            = true
  special          = true
  override_special = "!#&-_+?"
  keepers = {
    time = time_rotating.period.id
  }
}

output "random_password" {
  value     = random_password.create-password.result
  sensitive = true
}


terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "5.6.0"
    }
  }
}

resource "time_rotating" "example" {
  rotation_days = 1
}

resource "random_id" "server" {
  keepers = {
    # Generate a new password each time time rotates
    rotation_time = time_rotating.example.rotation_rfc3339
  }

  byte_length = 8
}

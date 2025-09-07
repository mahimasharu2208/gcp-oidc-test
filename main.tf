terraform {
  cloud {
    organization = "auth-learning"
    workspaces {
      name = "gcp-oidc-tfc-test"
    }
  }

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 5.38"
    }
  }
}

provider "google" {
  project = var.project_id
  region  = var.region
}

# Example resource: GCS bucket
resource "google_storage_bucket" "example" {
  name          = "${var.project_id}-tfc-bucket"
  location      = var.region
  force_destroy = true

  uniform_bucket_level_access = true

  versioning {
    enabled = true
  }

  lifecycle_rule {
    action {
      type = "Delete"
    }
    condition {
      age = 30
    }
  }
}


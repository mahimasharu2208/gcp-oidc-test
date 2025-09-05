terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 5.38" # recent provider version
    }
  }
  cloud {
    organization = "auth-learning"
    workspaces {
      name = "gcp-oidc-test"
    }
  }
}

provider "google" {
  project = "hc-30d203c965e840f283fc935a3d4"
  region  = "us-central1"
}

resource "google_storage_bucket" "demo_bucket" {
  name          = "test-mahima"
  location      = "US"
  force_destroy = true   # allow destroy even if bucket has objects

  uniform_bucket_level_access = true
}

terraform {
  # The configuration for this backend will be filled in by Terragrunt
  required_version = ">= 1.2.7"
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "~> 6.4.0"
    }
  }
}

provider "google" {}

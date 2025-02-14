terraform {
  # The configuration for this backend will be filled in by Terragrunt
  required_version = ">= 1.4.6"
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "~> 6.12.0"
    }
  }
}

provider "google" {}

terraform {
  required_providers {
    hcp = {
      source  = "hashicorp/hcp"
      version = "0.90.0"
    }
  }
}

provider "hcp" {}
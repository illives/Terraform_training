terraform {
  required_providers {
    archive = {
      source = "hashicorp/archive"
    }
    random = {
      source = "hashicorp/random"
    }
  }
}

resource "random_string" "random" {
  length  = 10
  special = true
  number  = false

}

data "archive_file" "archivozip" {
  type        = "zip"
  source_dir  = "data_backup/"
  output_path = "random_string.zip"
}

output "arquivzip" {
  value = data.archive_file.archivozip.output_size
}

output "random_string" {
  value = random_string.random.result
}
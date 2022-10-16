terraform {
    required_providers {
        kind = {
            source = "tehcyx/kind"
            version = "0.0.14"
        }
        shell = {
            source = "scottwinkler/shell"
            version = "1.7.10"
        }
    }
}

provider "shell" {
    interpreter = ["/bin/sh", "-c"]
    enable_parallelism = false
}

provider "kind" {}
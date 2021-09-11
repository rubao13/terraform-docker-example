terraform {
  required_version = ">= 0.15.0"
  required_providers {
    docker = {
      source = "kreuzwerker/docker"
      version = "2.11.0"
    }
  }
}

provider "docker" {}

resource "docker_image" "nginx" {
  name = "nginx:latest"
}

resource "docker_container" "web" {
  image = docker_image.nginx.latest
  name = "web"
  ports {
    internal = 80
    external = 80
  }
}

output "debug" {
  value = "Good luck! :)"
}

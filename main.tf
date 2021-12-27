terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 2.15.0"
    }
  }
}

provider "docker" {}

resource "docker_image" "nginx" {
  name = "nginx:1.21.4"
  keep_locally = false
}

resource "docker_container" "nginx" {
  name = "nginx"
  image = docker_image.nginx.latest
  ports {
    external = 8080
    internal = 80
  }
}

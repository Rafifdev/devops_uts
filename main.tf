terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.1"
    }
  }
}

provider "docker" {}

resource "docker_network" "uts_network" {
  name = "uts-network"
}

resource "docker_image" "mysql_image" {
  name         = "mysql:latest"
  keep_locally = true
}

resource "docker_container" "mysql_container" {
  image = docker_image.mysql_image.image_id
  name  = "uts-mysql"

  networks_advanced {
    name = docker_network.uts_network.name
  }

  env = [
    "MYSQL_ROOT_PASSWORD=rahasia_root",
    "MYSQL_DATABASE=uts_devops",
    "MYSQL_USER=mahasiswa",
    "MYSQL_PASSWORD=rahasia_user"
  ]

  ports {
    internal = 3306
    external = 3306
  }
}

resource "docker_image" "redis_image" {
  name         = "redis:7-alpine"
  keep_locally = true
}

resource "docker_container" "redis_container" {
  image = docker_image.redis_image.image_id
  name  = "uts-redis"

  networks_advanced {
    name = docker_network.uts_network.name
  }

  ports {
    internal = 6379
    external = 6379
  }
}
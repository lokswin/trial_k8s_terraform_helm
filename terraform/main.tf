# terraform/main.tf
provider "docker" {
  host = "unix:///var/run/docker.sock"
}

resource "docker_image" "my_app" {
  name = "my-app:latest"
  build {
    context = "../app"
  }
}

# You can add infrastructure provisioning resources here if needed

// Configure the Google Cloud provider
provider "google" {
  credentials = file("terraform2-sa.json")
  project     = "terraform2-302514"
  region      = "us-west1"
  zone        = "us-west1-a"
}

resource "google_compute_instance" "vm_instance" {
  name         = "terraform2"
  machine_type = "f1-micro"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }

  network_interface {
    # A default network is created for all GCP projects
    network = "default"
  }
}


provider "google" {
  credentials = "${var.creds}"
  project     = "${var.project}"
  region      = "${var.region}"
}

resource "google_compute_instance" "ptfe" {
  name         = "${var.environment_name}"
  machine_type = "n1-standard-2"
  count = "1"
  can_ip_forward = true
  zone         = "${var.zone}"
  project     = "${var.project}"

  tags = [
    "${var.environment_name}",
  ]

  boot_disk {
    initialize_params {
      image = "ubuntu-1604-xenial-v20180306"
      size = "80"
    }
  }

  network_interface {
    network = "${google_compute_network.main.id}"

    access_config {
      // Ephemeral IP
    }
  }

  metadata {
    sshKeys = "${var.user}:${var.public_key}"
  }
}
resource "google_compute_firewall" "default" {
  name    = "ptfefirewall"
  network = "${google_compute_network.main.id}"
  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports    = ["22","80", "8800", "443", "9870-9880" ]
  }
}

resource "google_compute_network" "main" {
  name                    = "${var.environment_name}"
  auto_create_subnetworks = true
}

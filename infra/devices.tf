resource "google_cloudiot_device" "raspberrypi3" {
  name     = "raspberrypi3"
  registry = google_cloudiot_registry.iot_poc_registry.id

  credentials {
    public_key {
      format = "RSA_PEM"
      key    = file("../device_certs/raspberrypi3_rsa_public.pem")
    }
  }

  blocked   = false
  log_level = "DEBUG"

  metadata = {
    test_key_1 = "test_value_1"
  }

  gateway_config {
    gateway_type = "NON_GATEWAY"
  }
}
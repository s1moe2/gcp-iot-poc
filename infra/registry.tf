resource "google_pubsub_topic" "default_devicestatus" {
  name = "default-devicestatus"
}

resource "google_pubsub_topic" "default_telemetry" {
  name = "default-telemetry"
}

resource "google_cloudiot_registry" "iot_poc_registry" {
  name = "iot-poc-registry"

  event_notification_configs {
    pubsub_topic_name = google_pubsub_topic.default_telemetry.id
    subfolder_matches = ""
  }

  state_notification_config = {
    pubsub_topic_name = google_pubsub_topic.default_devicestatus.id
  }

  mqtt_config = {
    mqtt_enabled_state = "MQTT_ENABLED"
  }

  http_config = {
    http_enabled_state = "HTTP_DISABLED"
  }

  log_level = "DEBUG"
}

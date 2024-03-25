resource "google_pubsub_topic" "test_topic" {
  project = var.project_id
  name = "test-topic"
}

// Pull subscription
resource "google_pubsub_subscription" "example_subscription" {
  project = var.project_id
  name  = "test-subscription"
  topic = google_pubsub_topic.test_topic.name
}

// Push subscription
#resource "google_pubsub_subscription" "test_subscription" {
#  name  = "test-subscription"
#  topic = google_pubsub_topic.test_topic.name
#
#  ack_deadline_seconds = 20
#  // Set to true to use push delivery, false for pull.
#  push_config {
#    // For push delivery, specify the endpoint here.
#    push_endpoint = "http://example.com/push"
#  }
#}

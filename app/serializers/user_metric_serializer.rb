# frozen_string_literal: true

class UserMetricSerializer
  include JSONAPI::Serializer
  attributes :email, :name, :exercise_metrics, :accelerometer_metrics
end

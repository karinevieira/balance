# frozen_string_literal: true

class AccelerometerMetricSerializer
  include JSONAPI::Serializer
  attributes :user_id, :exercise, :time_in_min, :level, :created_at
end

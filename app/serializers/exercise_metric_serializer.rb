# frozen_string_literal: true

class ExerciseMetricSerializer
  include JSONAPI::Serializer
  attributes :user_id, :name, :steps, :distance_in_m, :intensity, :duration_in_min, :created_at
end

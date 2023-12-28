# frozen_string_literal: true

class UserProfileSerializer
  include JSONAPI::Serializer
  attributes :weight_in_cm, :height_in_cm, :workout_in_min, :workout_days_frequency, :active_lifestyle, :gender, :physical_activities # rubocop:disable Layout/LineLength
end

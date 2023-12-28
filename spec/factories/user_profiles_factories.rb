# frozen_string_literal: true

FactoryBot.define do
  factory :user_profile do
    user
    weight_in_cm { 1 }
    height_in_cm { 1 }
    workout_in_min { 1 }
    workout_days_frequency { 1 }
    active_lifestyle { false }
  end
end

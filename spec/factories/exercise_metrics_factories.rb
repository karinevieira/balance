# frozen_string_literal: true

FactoryBot.define do
  factory :exercise_metric do
    user
    name { "My exercise" }
    steps { 1000 }
    distance_in_m { 1000 }
    intensity { "low" }
  end
end

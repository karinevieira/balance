# frozen_string_literal: true

FactoryBot.define do
  factory :accelerometer_metric do
    exercise_metric
    type { "Corrida" }
    time_in_min { 3 }
    level { "Sedentário" }
  end
end

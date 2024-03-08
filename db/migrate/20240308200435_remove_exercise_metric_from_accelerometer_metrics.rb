# frozen_string_literal: true

class RemoveExerciseMetricFromAccelerometerMetrics < ActiveRecord::Migration[7.1]
  def change
    remove_reference :accelerometer_metrics, :exercise_metric, null: false, foreign_key: true
  end
end

# frozen_string_literal: true

class RenameTypeToExerciseAccelerometerMetrics < ActiveRecord::Migration[7.1]
  def change
    rename_column :accelerometer_metrics, :type, :exercise
  end
end

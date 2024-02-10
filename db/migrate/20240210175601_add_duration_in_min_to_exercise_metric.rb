# frozen_string_literal: true

class AddDurationInMinToExerciseMetric < ActiveRecord::Migration[7.1]
  def change
    add_column :exercise_metrics, :duration_in_min, :integer
  end
end

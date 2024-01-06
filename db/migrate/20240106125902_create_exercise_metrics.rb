# frozen_string_literal: true

class CreateExerciseMetrics < ActiveRecord::Migration[7.1]
  def change
    create_table :exercise_metrics do |t|
      t.references :user, null: false, foreign_key: true
      t.text :name
      t.integer :steps
      t.integer :distance_in_m
      t.text :intensity

      t.timestamps
    end
  end
end

# frozen_string_literal: true

class CreateAccelerometerMetrics < ActiveRecord::Migration[7.1]
  def change
    create_table :accelerometer_metrics do |t|
      t.references :exercise_metric, null: false, foreign_key: true
      t.text :type
      t.integer :time_in_min
      t.text :level

      t.timestamps
    end
  end
end

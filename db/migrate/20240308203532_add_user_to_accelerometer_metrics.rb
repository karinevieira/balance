# frozen_string_literal: true

class AddUserToAccelerometerMetrics < ActiveRecord::Migration[7.1]
  def change
    add_reference :accelerometer_metrics, :user, null: false, foreign_key: true # rubocop:disable Rails/NotNullColumn
  end
end

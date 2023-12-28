# frozen_string_literal: true

class CreateUserProfiles < ActiveRecord::Migration[7.1]
  def change # rubocop:disable Metrics/MethodLength
    create_table :user_profiles do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :weight_in_cm, null: false
      t.integer :height_in_cm, null: false
      t.integer :workout_in_min, null: false
      t.integer :workout_days_frequency, null: false
      t.boolean :active_lifestyle, null: false, default: false
      t.text :gender
      t.text :physical_activities

      t.timestamps
    end
  end
end

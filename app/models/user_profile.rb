# frozen_string_literal: true

class UserProfile < ApplicationRecord
  belongs_to :user

  validates :weight, presence: true
  validates :height_in_cm, presence: true
  validates :workout_in_min, presence: true
  validates :workout_days_frequency, presence: true

  validates :weight, numericality: { greater_than: 0 }
  validates :height_in_cm, numericality: { greater_than: 0 }
  validates :workout_in_min, numericality: { greater_than: 0 }
  validates :workout_days_frequency, numericality: { greater_than_or_equal_to: 0 }
end

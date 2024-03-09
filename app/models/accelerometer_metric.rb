# frozen_string_literal: true

class AccelerometerMetric < ApplicationRecord
  belongs_to :user

  validates :exercise, presence: true
  validates :time_in_min, presence: true
  validates :level, presence: true

  validates :time_in_min, numericality: { greater_than_or_equal_to: 0 }
end

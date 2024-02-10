# frozen_string_literal: true

class ExerciseMetric < ApplicationRecord
  belongs_to :user

  validates :name, presence: true
  validates :intensity, presence: true

  validates :duration_in_min, numericality: { greater_than_or_equal_to: 0 }
end

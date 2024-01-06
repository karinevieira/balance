# frozen_string_literal: true

class ExerciseMetric < ApplicationRecord
  belongs_to :user

  validates :name, presence: true
  validates :intensity, presence: true

  validates :steps, numericality: { greater_than_or_equal_to: 0 }
  validates :distance_in_m, numericality: { greater_than_or_equal_to: 0 }
end

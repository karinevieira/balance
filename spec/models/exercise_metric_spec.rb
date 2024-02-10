# frozen_string_literal: true

require "rails_helper"

RSpec.describe ExerciseMetric do
  describe "associations" do
    it { is_expected.to belong_to(:user) }
  end

  describe "validations" do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:intensity) }

    it { is_expected.to validate_numericality_of(:steps).is_greater_than_or_equal_to(0) }
    it { is_expected.to validate_numericality_of(:distance_in_m).is_greater_than_or_equal_to(0) }
    it { is_expected.to validate_numericality_of(:duration_in_min).is_greater_than_or_equal_to(0) }
  end
end

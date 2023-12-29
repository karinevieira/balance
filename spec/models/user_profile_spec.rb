# frozen_string_literal: true

require "rails_helper"

RSpec.describe UserProfile do
  describe "associations" do
    it { is_expected.to belong_to(:user) }
  end

  describe "validations" do
    it { is_expected.to validate_presence_of(:weight) }
    it { is_expected.to validate_presence_of(:height_in_cm) }
    it { is_expected.to validate_presence_of(:workout_in_min) }
    it { is_expected.to validate_presence_of(:workout_days_frequency) }

    it { is_expected.to validate_numericality_of(:weight).is_greater_than(0) }
    it { is_expected.to validate_numericality_of(:height_in_cm).is_greater_than(0) }
    it { is_expected.to validate_numericality_of(:workout_in_min).is_greater_than(0) }
    it { is_expected.to validate_numericality_of(:workout_days_frequency).is_greater_than_or_equal_to(0) }
  end
end

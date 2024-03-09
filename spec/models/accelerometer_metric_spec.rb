# frozen_string_literal: true

require "rails_helper"

RSpec.describe AccelerometerMetric do
  describe "associations" do
    it { is_expected.to belong_to(:user) }
  end

  describe "validations" do
    it { is_expected.to validate_presence_of(:exercise) }
    it { is_expected.to validate_presence_of(:time_in_min) }
    it { is_expected.to validate_presence_of(:level) }

    it { is_expected.to validate_numericality_of(:time_in_min).is_greater_than_or_equal_to(0) }
  end
end

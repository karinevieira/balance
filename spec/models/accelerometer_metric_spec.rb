# frozen_string_literal: true

require "rails_helper"

RSpec.describe AccelerometerMetric do
  describe "associations" do
    it { is_expected.to belong_to(:exercise_metric) }
  end
end

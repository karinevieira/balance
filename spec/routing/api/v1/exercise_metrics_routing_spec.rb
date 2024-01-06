# frozen_string_literal: true

require "rails_helper"

RSpec.describe Api::V1::ExerciseMetricsController do
  it do
    expect(described_class).to route(:post, "/api/v1/exercise_metrics").to(
      controller: "api/v1/exercise_metrics", action: :create
    )
  end
end

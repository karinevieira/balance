# frozen_string_literal: true

require "rails_helper"

RSpec.describe Api::V1::ExerciseMetricsController do
  it do
    expect(described_class).to route(:get, "/api/v1/exercise_metrics").to(
      controller: "api/v1/exercise_metrics", action: :index
    )
  end

  it do
    expect(described_class).to route(:post, "/api/v1/exercise_metrics").to(
      controller: "api/v1/exercise_metrics", action: :create
    )
  end

  it do
    expect(described_class).to route(:put, "/api/v1/exercise_metrics/1").to(
      id: "1", controller: "api/v1/exercise_metrics",
      action: :update
    )
  end

  it do
    expect(described_class).to route(:patch, "/api/v1/exercise_metrics/1").to(
      id: "1", controller: "api/v1/exercise_metrics",
      action: :update
    )
  end
end

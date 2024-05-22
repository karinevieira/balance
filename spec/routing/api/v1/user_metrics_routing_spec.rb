# frozen_string_literal: true

require "rails_helper"

RSpec.describe Api::V1::UserMetricsController do
  it do
    expect(described_class).to route(:get, "/api/v1/user_metrics").to(
      controller: "api/v1/user_metrics", action: :index
    )
  end
end

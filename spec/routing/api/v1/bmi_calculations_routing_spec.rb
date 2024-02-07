# frozen_string_literal: true

require "rails_helper"

RSpec.describe Api::V1::BmiCalculationsController do
  it do
    expect(described_class).to route(:get, "/api/v1/bmi_calculations/1").to(
      id: "1", controller: "api/v1/bmi_calculations",
      action: :show
    )
  end
end

# frozen_string_literal: true

require "rails_helper"

RSpec.describe Api::V1::ProfilesController do
  it { is_expected.to route(:get, "/api/v1/profile").to(controller: "api/v1/profiles", action: :show) }

  it { is_expected.to route(:put, "/api/v1/profile").to(controller: "api/v1/profiles", action: :update) }
  it { is_expected.to route(:patch, "/api/v1/profile").to(controller: "api/v1/profiles", action: :update) }
end

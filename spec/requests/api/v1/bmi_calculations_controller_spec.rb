# frozen_string_literal: true

require "rails_helper"

RSpec.describe Api::V1::BmiCalculationsController do
  describe "GET #show" do
    it "renders a successful response" do
      profile = create(:user_profile, weight: 60, height_in_cm: 165)

      get api_v1_bmi_calculation_path(profile.user), as: :json

      expect(response).to be_successful
    end

    it "returns the user's BMI" do
      profile = create(:user_profile, weight: 60, height_in_cm: 165)

      get api_v1_bmi_calculation_path(profile.user), as: :json

      parsed_response_body = response.parsed_body["data"]

      expect(parsed_response_body["imc"]).to eq("22.04")
    end
  end
end

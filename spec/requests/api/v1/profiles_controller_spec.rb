# frozen_string_literal: true

require "rails_helper"

RSpec.describe Api::V1::ProfilesController do
  describe "GET #index" do
    it "renders a successful response" do
      get api_v1_profiles_path, as: :json

      expect(response).to be_successful
    end
  end

  describe "GET #show" do
    it "renders a successful response" do
      user = create(:user)

      get api_v1_profile_path(user), as: :json

      expect(response).to be_successful
    end
  end

  describe "PUT #update" do
    context "when the user is authenticated" do
      it "renders a successful response" do
        user = create(:user)
        jwt_token = sign_in(user)

        attributes = {
          weight: 50, height_in_cm: 150, workout_in_min: 60, workout_days_frequency: 3, active_lifestyle: true
        }

        put api_v1_profile_path(user), headers: { authorization: jwt_token }, params: { profile: attributes }, as: :json

        expect(response).to be_successful
      end

      it "updates the user profile" do
        user = create(:user)
        jwt_token = sign_in(user)

        attributes = {
          weight: 50, height_in_cm: 150, workout_in_min: 60, workout_days_frequency: 3, active_lifestyle: true
        }

        put api_v1_profile_path(user), headers: { authorization: jwt_token }, params: { profile: attributes }, as: :json

        expect(user.reload.profile.attributes).to include(
          "weight" => 50,
          "height_in_cm" => 150,
          "workout_in_min" => 60,
          "workout_days_frequency" => 3,
          "active_lifestyle" => true
        )
      end
    end

    context "when the user is not authenticated" do
      it "renders an unauthorized response" do
        user = create(:user)

        attributes = {
          weight: 50, height_in_cm: 150, workout_in_min: 60, workout_days_frequency: 3, active_lifestyle: true
        }

        put api_v1_profile_path(user), headers: { authorization: nil }, params: { profile: attributes }, as: :json

        expect(response).to have_http_status(:unauthorized)
      end
    end
  end
end

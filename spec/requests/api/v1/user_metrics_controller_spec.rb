# frozen_string_literal: true

require "rails_helper"

RSpec.describe Api::V1::UserMetricsController do
  describe "GET #index" do
    it "renders a successful response" do
      user = create(:user)

      get api_v1_user_metrics_path(user_id: user.id), as: :json

      expect(response).to be_successful
    end

    it "renders a list of user's accelerometer metrics" do
      user = create(:user)
      create_list(:accelerometer_metric, 3, user: user)

      get api_v1_user_metrics_path(user_id: user.id), as: :json

      parsed_response_body = response.parsed_body["data"]
      accelerometer_metrics_response = parsed_response_body["attributes"]["accelerometer_metrics"]

      expect(accelerometer_metrics_response.count).to eq(3)
    end

    it "renders a list of user's exercise metrics" do
      user = create(:user)
      create_list(:exercise_metric, 3, user: user)

      get api_v1_user_metrics_path(user_id: user.id), as: :json

      parsed_response_body = response.parsed_body["data"]
      exercise_metrics_response = parsed_response_body["attributes"]["exercise_metrics"]

      expect(exercise_metrics_response.count).to eq(3)
    end
  end
end

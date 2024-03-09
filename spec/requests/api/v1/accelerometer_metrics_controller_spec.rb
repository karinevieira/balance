# frozen_string_literal: true

require "rails_helper"

RSpec.describe Api::V1::AccelerometerMetricsController do
  describe "GET #index" do
    it "renders a successful response" do
      user = create(:user)

      get api_v1_accelerometer_metrics_path(user_id: user.id), as: :json

      expect(response).to be_successful
    end

    it "renders a list of user accelerometer metrics" do
      user = create(:user)
      create_list(:accelerometer_metric, 3, user: user)

      get api_v1_accelerometer_metrics_path(user_id: user.id), as: :json

      parsed_response_body = response.parsed_body["data"]

      expect(parsed_response_body.count).to eq(3)
    end
  end

  describe "POST #create" do
    context "when attributes are valid" do
      it "renders a created response" do
        user = create(:user)

        attributes = { exercise: "walk", time_in_min: 3, level: "sedentary" }

        post api_v1_accelerometer_metrics_path,
          params: { accelerometer_metric: attributes, user_id: user.id }, as: :json

        expect(response).to have_http_status(:created)
      end

      it "creates a new accelerometer metric for user" do
        user = create(:user)

        attributes = { exercise: "walk", time_in_min: 3, level: "sedentary" }

        post api_v1_accelerometer_metrics_path,
          params: { accelerometer_metric: attributes, user_id: user.id }, as: :json

        expect(user.reload.accelerometer_metrics.last.attributes).to include(
          "exercise" => "walk",
          "time_in_min" => 3,
          "level" => "sedentary"
        )
      end
    end

    context "when attributes are invalid" do
      it "renders an unprocessable_entity response" do
        user = create(:user)

        attributes = { exercise: nil, time_in_min: nil, level: nil }

        post api_v1_accelerometer_metrics_path,
          params: { accelerometer_metric: attributes, user_id: user.id }, as: :json

        expect(response).to have_http_status(:unprocessable_entity)
      end

      it "doesn't create a new accelerometer metric for user" do
        user = create(:user)

        attributes = { exercise: nil, time_in_min: nil, level: nil }

        post api_v1_accelerometer_metrics_path,
          params: { accelerometer_metric: attributes, user_id: user.id }, as: :json

        expect(user.reload.accelerometer_metrics).to be_empty
      end
    end
  end

  describe "PUT #update" do
    context "when attributes are valid" do
      it "renders a successful response" do
        user = create(:user)
        accelerometer_metric = create(:accelerometer_metric, user: user)

        attributes = { time_in_min: 5 }

        put api_v1_accelerometer_metric_path(accelerometer_metric),
          params: { accelerometer_metric: attributes, user_id: user.id }, as: :json

        expect(response).to be_successful
      end

      it "updates user's accelerometer metric" do
        user = create(:user)
        accelerometer_metric = create(:accelerometer_metric, time_in_min: 3, user: user)

        attributes = { time_in_min: 5 }

        put api_v1_accelerometer_metric_path(accelerometer_metric),
          params: { accelerometer_metric: attributes, user_id: user.id }, as: :json

        expect(user.reload.accelerometer_metrics.last.time_in_min).to eq(5)
      end
    end

    context "when attributes are invalid" do
      it "renders an unprocessable_entity response" do
        user = create(:user)
        accelerometer_metric = create(:accelerometer_metric, user: user)

        attributes = { exercise: nil, time_in_min: 5 }

        put api_v1_accelerometer_metric_path(accelerometer_metric),
          params: { accelerometer_metric: attributes, user_id: user.id }, as: :json

        expect(response).to have_http_status(:unprocessable_entity)
      end

      it "doesn't update user's accelerometer metric" do
        user = create(:user)
        accelerometer_metric = create(:accelerometer_metric, time_in_min: 3, user: user)

        attributes = { exercise: nil, time_in_min: 5 }

        put api_v1_accelerometer_metric_path(accelerometer_metric),
          params: { accelerometer_metric: attributes, user_id: user.id }, as: :json

        expect(user.reload.accelerometer_metrics.last.time_in_min).to eq(3)
      end
    end
  end

  describe "DELETE #destroy" do
    it "renders a successful response" do
      user = create(:user)
      accelerometer_metric = create(:accelerometer_metric, user: user)

      delete api_v1_accelerometer_metric_path(accelerometer_metric),
        params: { user_id: user.id }, as: :json

      expect(response).to have_http_status(:no_content)
    end

    it "destroys user's accelerometer metric" do
      user = create(:user)
      accelerometer_metric = create(:accelerometer_metric, user: user)

      delete api_v1_accelerometer_metric_path(accelerometer_metric),
        params: { user_id: user.id }, as: :json

      expect(user.reload.accelerometer_metrics.last).not_to eq(accelerometer_metric)
    end
  end
end

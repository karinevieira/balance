# frozen_string_literal: true

require "rails_helper"

RSpec.describe Api::V1::ExerciseMetricsController do
  describe "GET #index" do
    it "renders a successful response" do
      user = create(:user)

      get api_v1_exercise_metrics_path(user_id: user.id), as: :json

      expect(response).to be_successful
    end

    it "renders a list of user exercise metrics" do
      user = create(:user)
      create_list(:exercise_metric, 3, user: user)

      get api_v1_exercise_metrics_path(user_id: user.id), as: :json

      parsed_response_body = response.parsed_body["data"]

      expect(parsed_response_body.count).to eq(3)
    end
  end

  describe "POST #create" do
    # rubocop:disable RSpec/NestedGroups
    context "when the user is authenticated" do
      context "when attributes are valid" do
        it "renders a created response" do
          jwt_token = sign_in

          attributes = {
            name: "test walk", steps: 1000, distance_in_m: 1000, intensity: "high"
          }

          post api_v1_exercise_metrics_path, headers: { authorization: jwt_token },
            params: { exercise_metric: attributes }, as: :json

          expect(response).to have_http_status(:created)
        end

        it "creates a new exercise metric for user" do
          user = create(:user)
          jwt_token = sign_in(user)

          attributes = {
            name: "test walk", steps: 1000, distance_in_m: 1000, intensity: "high"
          }

          post api_v1_exercise_metrics_path, headers: { authorization: jwt_token },
            params: { exercise_metric: attributes }, as: :json

          expect(user.reload.exercise_metrics.last.attributes).to include(
            "name" => "test walk",
            "steps" => 1000,
            "distance_in_m" => 1000,
            "intensity" => "high"
          )
        end
      end

      context "when attributes are invalid" do
        it "renders an unprocessable_entity response" do
          jwt_token = sign_in

          attributes = {
            name: nil, steps: 1000, distance_in_m: 1000, intensity: nil
          }

          post api_v1_exercise_metrics_path, headers: { authorization: jwt_token },
            params: { exercise_metric: attributes }, as: :json

          expect(response).to have_http_status(:unprocessable_entity)
        end

        it "doesn't create a new exercise metric for user" do
          user = create(:user)
          jwt_token = sign_in(user)

          attributes = {
            name: nil, steps: 1000, distance_in_m: 1000, intensity: nil
          }

          post api_v1_exercise_metrics_path, headers: { authorization: jwt_token },
            params: { exercise_metric: attributes }, as: :json

          expect(user.reload.exercise_metrics).to be_empty
        end
      end
    end
    # rubocop:enable RSpec/NestedGroups

    context "when the user is not authenticated" do
      it "renders an unauthorized response" do
        attributes = {
          name: "test walk", steps: 1000, distance_in_m: 1000, intensity: "high"
        }

        post api_v1_exercise_metrics_path, headers: { authorization: nil },
          params: { exercise_metric: attributes }, as: :json

        expect(response).to have_http_status(:unauthorized)
      end
    end
  end

  describe "PUT #update" do
    # rubocop:disable RSpec/NestedGroups
    context "when the user is authenticated" do
      context "when attributes are valid" do
        it "renders a successful response" do
          user = create(:user)
          jwt_token = sign_in(user)
          exercise_metric = create(:exercise_metric, user: user)

          attributes = { steps: 2000, distance_in_m: 2000 }

          put api_v1_exercise_metric_path(exercise_metric), headers: { authorization: jwt_token },
            params: { exercise_metric: attributes }, as: :json

          expect(response).to be_successful
        end

        it "updates user's exercise metric" do
          user = create(:user)
          jwt_token = sign_in(user)
          exercise_metric = create(:exercise_metric, name: "old test walk", user: user)

          attributes = { name: "new test walk" }

          put api_v1_exercise_metric_path(exercise_metric), headers: { authorization: jwt_token },
            params: { exercise_metric: attributes }, as: :json

          expect(user.reload.exercise_metrics.last.name).to eq("new test walk")
        end
      end

      context "when attributes are invalid" do
        it "renders an unprocessable_entity response" do
          user = create(:user)
          jwt_token = sign_in(user)
          exercise_metric = create(:exercise_metric, user: user)

          attributes = {
            name: nil, steps: 1000, distance_in_m: 1000, intensity: nil
          }

          put api_v1_exercise_metric_path(exercise_metric), headers: { authorization: jwt_token },
            params: { exercise_metric: attributes }, as: :json

          expect(response).to have_http_status(:unprocessable_entity)
        end

        it "doesn't update user's exercise metric" do
          user = create(:user)
          jwt_token = sign_in(user)
          exercise_metric = create(:exercise_metric, name: "old test walk", user: user)

          attributes = { name: "new test walk", intensity: nil }

          put api_v1_exercise_metric_path(exercise_metric), headers: { authorization: jwt_token },
            params: { exercise_metric: attributes }, as: :json

          expect(user.reload.exercise_metrics.last.name).to eq("old test walk")
        end
      end
    end
    # rubocop:enable RSpec/NestedGroups

    context "when the user is not authenticated" do
      it "renders an unauthorized response" do
        exercise_metric = create(:exercise_metric)

        attributes = {
          name: "test walk", steps: 1000, distance_in_m: 1000, intensity: "high"
        }

        put api_v1_exercise_metric_path(exercise_metric), headers: { authorization: nil },
          params: { exercise_metric: attributes }, as: :json

        expect(response).to have_http_status(:unauthorized)
      end
    end
  end
end

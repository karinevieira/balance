# frozen_string_literal: true

module Api
  module V1
    class ExerciseMetricsController < ApplicationController
      skip_before_action :authenticate_user!, only: %i[index create update]

      def index
        options = { is_collection: true }

        render json: ExerciseMetricSerializer.new(current_user.exercise_metrics, options)
      end

      def create
        exercise_metric = current_user.exercise_metrics.new(exercise_metric_params)

        if exercise_metric.save
          render json: ExerciseMetricSerializer.new(exercise_metric), status: :created
        else
          render json: exercise_metric.errors, status: :unprocessable_entity
        end
      end

      def update
        exercise_metric = current_user.exercise_metrics.find(params[:id])

        if exercise_metric.update(exercise_metric_params)
          render json: ExerciseMetricSerializer.new(exercise_metric)
        else
          render json: exercise_metric.errors, status: :unprocessable_entity
        end
      end

      private

      def exercise_metric_params
        params.require(:exercise_metric).permit(:name, :steps, :distance_in_m, :intensity, :duration_in_min)
      end

      def current_user
        @current_user ||= User.find(params[:user_id])
      end
    end
  end
end

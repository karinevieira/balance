# frozen_string_literal: true

module Api
  module V1
    class ExerciseMetricsController < ApplicationController
      before_action :authenticate_user!, only: [:create]

      def create
        exercise_metric = current_user.exercise_metrics.new(exercise_metric_params)

        if exercise_metric.save
          render json: ExerciseMetricSerializer.new(exercise_metric), status: :created
        else
          render json: exercise_metric.errors, status: :unprocessable_entity
        end
      end

      private

      def exercise_metric_params
        params.require(:exercise_metric).permit(:name, :steps, :distance_in_m, :intensity)
      end
    end
  end
end

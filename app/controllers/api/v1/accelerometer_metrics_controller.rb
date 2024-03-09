# frozen_string_literal: true

module Api
  module V1
    class AccelerometerMetricsController < ApplicationController
      skip_before_action :authenticate_user!, only: %i[index create update destroy]

      def index
        options = { is_collection: true }

        render json: AccelerometerMetricSerializer.new(current_user.accelerometer_metrics, options)
      end

      def create
        accelerometer_metric = current_user.accelerometer_metrics.new(accelerometer_metric_params)

        if accelerometer_metric.save
          render json: AccelerometerMetricSerializer.new(accelerometer_metric), status: :created
        else
          render json: accelerometer_metric.errors, status: :unprocessable_entity
        end
      end

      def update
        accelerometer_metric = current_user.accelerometer_metrics.find(params[:id])

        if accelerometer_metric.update(accelerometer_metric_params)
          render json: AccelerometerMetricSerializer.new(accelerometer_metric)
        else
          render json: accelerometer_metric.errors, status: :unprocessable_entity
        end
      end

      def destroy
        accelerometer_metric = current_user.accelerometer_metrics.find(params[:id])

        accelerometer_metric.destroy
      end

      private

      def accelerometer_metric_params
        params.require(:accelerometer_metric).permit(:exercise, :time_in_min, :level)
      end

      def current_user
        @current_user ||= User.find(params[:user_id])
      end
    end
  end
end

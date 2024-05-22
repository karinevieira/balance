# frozen_string_literal: true

module Api
  module V1
    class UserMetricsController < ApplicationController
      skip_before_action :authenticate_user!, only: :index

      def index
        current_user = User.find(params[:user_id])
        render json: UserMetricSerializer.new(current_user)
      end
    end
  end
end

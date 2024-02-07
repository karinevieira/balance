# frozen_string_literal: true

module Api
  module V1
    class BmiCalculationsController < ApplicationController
      skip_before_action :authenticate_user!, only: :show

      def show
        current_user = User.find(params[:id])

        render json: UserBmiSerializer.new(current_user)
      end
    end
  end
end

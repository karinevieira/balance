# frozen_string_literal: true

module Api
  module V1
    class BmiCalculationsController < ApplicationController
      skip_before_action :authenticate_user!, only: :show

      def show
        current_user = User.find(params[:id])

        render json: { data: { user: current_user.email, imc: current_user.profile.calculate_bmi } }
      end
    end
  end
end

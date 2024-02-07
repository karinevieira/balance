# frozen_string_literal: true

module Api
  module V1
    class BmiCalculationsController < ApplicationController
      skip_before_action :authenticate_user!, only: :show

      def show
        current_user = User.find(params[:id])
        bmi = calculate(current_user.profile)

        render json: { data: { user: current_user.email, imc: bmi } }
      end

      private

      def calculate(user)
        height = height_in_m(user.height_in_cm)

        result = user.weight / (height * height)

        format("%.2f", result)
      end

      def height_in_m(height_in_cm)
        @height_in_m ||= height_in_cm / 100.0
      end
    end
  end
end

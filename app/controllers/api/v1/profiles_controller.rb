# frozen_string_literal: true

module Api
  module V1
    class ProfilesController < ApplicationController
      def show
        render json: UserSerializer.new(current_user)
      end

      def update
        if profile.update(user_params[:profile_attributes])
          render json: UserSerializer.new(current_user)
        else
          render json: profile.errors, status: :unprocessable_entity
        end
      end

      private

      def user_params
        params.require(:user).permit(
          profile_attributes: %i[
            weight height_in_cm workout_in_min workout_days_frequency
            active_lifestyle gender physical_activities
          ]
        )
      end

      def profile
        current_user.profile || current_user.build_profile
      end
    end
  end
end

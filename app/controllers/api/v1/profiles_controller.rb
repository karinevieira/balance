# frozen_string_literal: true

module Api
  module V1
    class ProfilesController < ApplicationController
      def show
        render json: UserSerializer.new(current_user)
      end

      def update
        if profile.update(profile_params)
          render json: UserSerializer.new(current_user)
        else
          render json: profile.errors, status: :unprocessable_entity
        end
      end

      private

      def profile_params
        params.require(:profile).permit(
          :weight,
          :height_in_cm,
          :workout_in_min,
          :workout_days_frequency,
          :active_lifestyle,
          :gender,
          :physical_activities
        )
      end

      def profile
        current_user.profile || current_user.build_profile
      end
    end
  end
end

# frozen_string_literal: true

class ApplicationController < ActionController::API
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[name phone_number password_confirmation])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[name phone_number])
  end
end

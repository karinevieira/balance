# frozen_string_literal: true

class UserBmiSerializer
  include JSONAPI::Serializer
  set_type :user_bmi_calculation

  attributes :id, :email

  attribute :imc do |object|
    object.profile.calculate_bmi
  end
end

# frozen_string_literal: true

class User < ApplicationRecord
  include Devise::JWT::RevocationStrategies::JTIMatcher

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :validatable,
    :jwt_authenticatable, jwt_revocation_strategy: self

  attr_accessor :password_confirmation

  validates :name, length: { maximum: 60 }, allow_nil: true

  validates :password, confirmation: true
end

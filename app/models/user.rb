# frozen_string_literal: true

class User < ApplicationRecord
  include Devise::JWT::RevocationStrategies::JTIMatcher

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :validatable,
    :jwt_authenticatable, jwt_revocation_strategy: self

  attr_accessor :password_confirmation

  has_one :profile, class_name: "UserProfile", dependent: :destroy

  has_many :exercise_metrics, dependent: :destroy
  has_many :accelerometer_metrics, dependent: :destroy

  accepts_nested_attributes_for :profile, update_only: true

  validates :name, length: { maximum: 60 }, allow_nil: true

  validates :password, confirmation: true
end

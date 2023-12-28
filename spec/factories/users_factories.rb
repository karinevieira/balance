# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    name { "Jane Doe" }
    sequence(:email) { |n| "janedoe#{n}@balance.app" }
    password { "password" }
  end
end

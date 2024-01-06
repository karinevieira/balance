# frozen_string_literal: true

require "rails_helper"

RSpec.describe User do
  describe "associations" do
    it { is_expected.to have_one(:profile).class_name("UserProfile").dependent(:destroy) }

    it { is_expected.to have_many(:exercise_metrics).dependent(:destroy) }

    it { is_expected.to accept_nested_attributes_for(:profile) }
  end

  describe "validations" do
    it { is_expected.to validate_length_of(:name).is_at_most(60) }

    it { is_expected.to validate_confirmation_of(:password) }
  end
end

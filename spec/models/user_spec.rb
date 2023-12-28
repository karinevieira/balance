# frozen_string_literal: true

require "rails_helper"

RSpec.describe User do
  describe "validations" do
    it { is_expected.to validate_length_of(:name).is_at_most(60) }

    it { is_expected.to validate_confirmation_of(:password) }
  end
end

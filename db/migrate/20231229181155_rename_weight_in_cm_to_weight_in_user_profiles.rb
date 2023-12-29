# frozen_string_literal: true

class RenameWeightInCmToWeightInUserProfiles < ActiveRecord::Migration[7.1]
  def change
    rename_column :user_profiles, :weight_in_cm, :weight
  end
end

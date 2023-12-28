# frozen_string_literal: true

class AddNameAndPhoneToUsers < ActiveRecord::Migration[7.1]
  def change
    change_table :users, bulk: true do |t|
      t.string :name
      t.string :phone_number
    end
  end
end

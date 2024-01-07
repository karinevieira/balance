# frozen_string_literal: true

Rails.logger.debug "Seeding default data..."
Dir[Rails.root.join("db/seeds/*.rb")].each do |seed|
  load seed
end

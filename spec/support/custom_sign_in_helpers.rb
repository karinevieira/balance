# frozen_string_literal: true

module CustomSignInHelpers
  def sign_in(user = create(:user))
    post "/login", params: { user: { email: user.email, password: "password" } }

    response.headers["authorization"]
  end
end

RSpec.configure do |config|
  %i[request].each do |type|
    config.include CustomSignInHelpers, type: type
  end
end

# frozen_string_literal: true

require "jwt"
# jwt
class Token
  class << self
    def generate(user, is_card = false)
      encode(
        mobile: user.mobile,
        id: user.id,
        time: Time.now
      )
    end

    def encode(payload)
      JWT.encode(payload, Rails.application.secrets.secret_key_base)
    end

    def decode(token)
      JWT.decode(token, Rails.application.secrets.secret_key_base)
    end
  end
end

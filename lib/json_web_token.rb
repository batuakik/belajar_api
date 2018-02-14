class JsonWebToken
    HMAC_SECRET = Rails.application.secrets.secret_key_base

    def self.encode(payload, expired = 24.hours)
        payload[:exp] = (Time.now + expired).to_i

        JWT.encode(payload, HMAC_SECRET)
    end

    def self.decode(token)
        body = JWT.decode(token, HMAC_SECRET)[0]

        HashWithIndifferentAccess.new body
    rescue JWT::DecodeError => e
        raise ErrorHandler::InvalidToken, e.message
    end
end

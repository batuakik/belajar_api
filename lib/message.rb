class Message
    def self.authenticate_error
        "Please check your username or password"
    end

    def self.invalid_token
        "Please check your token or relogin"
    end

    def self.missing_token
        "Token is missing"
    end

    def self.token_expire
        "Token has been expired"
    end
end

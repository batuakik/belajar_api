module AuthorizeToken
    def validate_token
        token = get_header_token

        if !check_expire(token)
            raise(ErrorHandler::InvalidToken, Message.token_expire)
        end
    end

    def get_current_user(token)
        @currentUser = User.find_by_id(token[:user_id])
    rescue ActiveRecord::RecordNotFound => e
        raise(ErrorHandler::InvalidToken, Message.invalid_token + ", " + e.message)
    end

    private
        def check_expire(token)
            Time.at(token[:exp]).to_i < Time.now.to_i
        end

        def get_header_token
            if headers['Authorization'].present?
                return JsonWebToken.decode(headers['Authorization'].split(' ').last)
            else
                raise(ErrorHandler::MissingToken, Message.missing_token)
            end
        end
end

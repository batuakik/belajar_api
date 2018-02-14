module AuthorizeToken
    def validate_token
        token = get_header_token
    end

    def get_current_user(token)
        @currentUser = User.find_by_id(token[:user_id])
    rescue ActiveRecord::RecordNotFound => e
        raise(ErrorHandler::InvalidToken, Message.invalid_token + ", " + e.message)
    end

    private
        def get_header_token
            if request.headers['Authorization'].present?
                return JsonWebToken.decode(request.headers['Authorization'].split(' ').last)
            else
                raise(ErrorHandler::MissingToken, Message.missing_token)
            end
        end
end

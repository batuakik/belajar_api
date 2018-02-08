class AuthenticatesController < ApplicationController
    skip_before_action :verify_authenticity_token, :validate_token

    def login
        params = params_login

        @user = User.find_by_username(params[:username])

        if @user.nil? || !@user.authenticate(params[:password])
            raise(ErrorHandler::AuthenticateError, Message.authenticate_error)
        end

        render_json({
            auth: {
                token: JsonWebToken.encode({user_id: @user.id})
            }
        })
    end

    protected 
        def params_login
            params.require('auth').permit(:username, :password)
        end
end

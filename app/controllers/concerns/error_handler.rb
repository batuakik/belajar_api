module ErrorHandler
    extend ActiveSupport::Concern

    class AuthenticateError < StandardError; end
    class InvalidToken < StandardError; end
    class MissingToken < StandardError; end

    included do
        rescue_from ErrorHandler::AuthenticateError, with: :unauthorized
        rescue_from ErrorHandler::InvalidToken, with: :unauthorized
        rescue_from ErrorHandler::MissingToken, with: :unauthorized
        rescue_from ActionController::ParameterMissing, with: :bad_request
    end

    private
        def bad_request(error)
            error = {
                errors: {
                    title: "Bad Request",
                    description: error.message,
                    params: params,
                    status: 400
                }
            }

            render_json(error, :bad_request)
        end

        def unauthorized(error)
            error = {
                errors: {
                    title: "Unauthorized",
                    description: error.message,
                    params: params,
                    status: 401
                }
            }

            render_json(error, :unauthorized)
        end
    
        def unprocessable_entity(error)
            error = {
                errors: {
                    title: "Unprocessable Entity",
                    description: error.message,
                    params: params,
                    status: 402
                }
            }

            render_json(error, :unprocessable_entity)
        end
    
        def method_not_allowed(error)
            error = {
                errors: {
                    title: "Method not allowed",
                    description: error.message,
                    params: params,
                    status: 405
                }
            }

            render_json(error, :method_not_allowed)
        end
    
        def internal_server_error(error)
            error = {
                errors: {
                    title: "Internal Server Error",
                    description: error.message,
                    params: params,
                    status: 500
                }
            }

            render_json(error, :internal_server_error)
        end
end

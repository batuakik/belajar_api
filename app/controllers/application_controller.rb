class ApplicationController < JSONAPI::ResourceController
    protect_from_forgery with: :null_session

    include Response
    include ErrorHandler
    include AuthorizeToken

    before_action :validate_token
end

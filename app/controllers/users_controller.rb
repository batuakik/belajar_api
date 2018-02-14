class UsersController < ApplicationController
    skip_before_action :verify_authenticity_token
    before_action :validate_token, except: [:create]
end

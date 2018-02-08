class User < ApplicationRecord
    has_secure_password

    validates :username, presence: true, uniqueness: {scope: :username}, length: {minimum: 5, maximum: 20}
    validates :password, presence: true, confirmation: true, length: {minimum: 5, maximum: 200}, on: :create
    validates :password, confirmation: true, length: {minimum: 5, maximum: 200}, on: :update
end

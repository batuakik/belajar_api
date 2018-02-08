class UserResource < JSONAPI::Resource
    attributes :username, :password

    def fetchable_fields
        super - [:password]
    end
end

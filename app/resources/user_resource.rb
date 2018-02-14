class UserResource < JSONAPI::Resource
    attributes :firstname, :lastname, :address, :username, :password

    def fetchable_fields
        super - [:password]
    end
end

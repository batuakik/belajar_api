module Response
    def render_json(data, status = :ok)
        render json: data, status: status
    end
end

class ApplicationController < ActionController::Base
    require_relative '../models/token'

    def current_user
        @current_user
    end

    def authorize_user
        token = request.headers['Authorization']&.split(' ')&.last

        if token.present?
            decoded_token = JWT.decode(
                token, 
                'secret_key', 
                true, 
                algorithm: 'HS256'
            )

            @current_user = User.find_by(id: decoded_token[0]['user_id'])

            if @current_user.nil? || Token.blacklisted?(token)
                render json: {
                    error: "Invalid token"
                }, status: :unauthorized            
            end
        else 
            render json: {
                error: "No token provided"
            }, status: :unauthorized
        end
    end
end

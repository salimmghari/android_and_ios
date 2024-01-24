class UserController < ApplicationController
    skip_before_action :verify_authenticity_token
    before_action :authorize_user, only: [:logout]

    def signup
        @user = User.new(user_params)
    
        if @user.save
            token = generate_token(user_id: @user.id)

            render json: {
                token: token 
            }
        else
            render json: {
                errors: @user.errors.full_messages
            }, status: :unprocessable_entity
        end
    end

    def login
        @user = User.find_by(
            username: user_params[:username]
        )

        if @user.nil?
            render json: {
                error: 'User not found' 
            }, status: :not_found            
        end
    
        if @user.authenticate(user_params[:password])
            token = generate_token(user_id: @user.id)

            render json: {
                token: token 
            }
        else
            render json: {
                error: 'Invalid username or password' 
            }, status: :unauthorized
        end
    end

    def logout
        Token.blacklist(request.headers['Authorization']&.split(' ')&.last)
        
        render json: {}, status: :no_content
    end

    private 

    def user_params
        params.require(:user).permit(
            :username, 
            :password,
            :password_confirmation
        )
    end

    def generate_token(payload)
        payload[:exp] = Time.now.to_i + 60 * 60

        return JWT.encode(
            payload, 
            'secret_key', 
            'HS256'
        )
    end
end

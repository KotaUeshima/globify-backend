class AuthController < ApplicationController
    skip_before_action :authorized, only: [:login]

    # login user and create JWT token
    def login
        @user = User.find_by(email: user_login_params[:email])
        
        if @user && @user.authenticate(user_login_params[:password])
          @token = encode_token({user_id: @user.id})
          render json: {user: UserSerializer.new(@user), jwt: @token }, status: :accepted        
       elsif @user
          render json: { error: "Invalid password"}, status: :unauthorized
       else
          render json: { error: "Email does not exist"}, status: :unauthorized
      end
    end

    # check if user is logged in for current session
    def authorization
        render json: {user: UserSerializer.new(@user)}
    end
    
    private

    def user_login_params
        params.require(:user).permit(:email, :password)
    end
end
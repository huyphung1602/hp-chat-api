module Api::V1
  class UsersController < ApplicationController
    def create
      @user = User.create!(user_params)
      session[:user_id] = @user.id

      json_response({ user: @user.name, email: @user.email })
    end

    private

    def user_params
      params
        .require(:user)
        .permit(
          :name,
          :email,
          :password,
        )
    end
  end
end

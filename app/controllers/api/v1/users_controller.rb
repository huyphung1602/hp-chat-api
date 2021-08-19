module Api::V1
  class UsersController < ApplicationController
    def create
      @user = User.create!(user_params.merge(password: params.require(:password)))
      session[:user_id] = @user.id

      json_response({ user: @user.name, email: @user.email })
    rescue StandardError => e
      json_response({ errors: e.message }, 422)
    end

    private

    def user_params
      params
        .require(:user)
        .permit(
          :name,
          :email,
        )
    end
  end
end

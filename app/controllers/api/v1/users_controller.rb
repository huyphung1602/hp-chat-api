module Api::V1
  class UsersController < ApplicationController
    skip_before_action :verify_authenticity_token, only: [:create]

    def create
      raise StandardError, 'You are logged in!' if logged_in?

      user = User.create!(user_params.merge(password: params.require(:password)))
      session[:user_id] = user.id

      json_response({ id: user.id, user: user.name })
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

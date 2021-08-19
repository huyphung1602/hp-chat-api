module Api::V1
  class SessionsController < ApplicationController
    skip_before_action :verify_authenticity_token, only: [:create]

    def create
      @user = User.find_by(email: params[:email])
      if @user && @user.authenticate(params[:password])
         session[:user_id] = @user.id
      end

      json_response({ id: @user.id, user: @user.name })
    end
  end
end

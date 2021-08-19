module Api::V1
  class SessionsController < ApplicationController
    def create
      @user = User.find_by(email: params[:email])
      if @user && @user.authenticate(params[:password])
         sessions[:user_id] = @user.id
      end

      json_response({ user: @user.name, email: @user.email })
   end
  end
end

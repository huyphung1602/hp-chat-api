module Api::V1
  class MessagesController < ApplicationController
    before_action :authenticate_user!

    def index
      messages = Message.all.includes(:user).map do |message|
        {
          id: message.id,
          content: message.content,
          owner: {
            id: message.user.id,
            name: message.user.name,
          },
          room_id: message.room_id,
        }
      end

      json_response(messages)
    end

    def create
      params.require([:content, :room_id])
      message = Message.create!(
        user_id: current_user.id,
        content: params[:content],
        room_id: params[:room_id],
      )

      json_response(message)
    end
  end
end

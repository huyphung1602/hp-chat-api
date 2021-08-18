module Api::V1
  class MessagesController < ApplicationController
    def index
      @messages = Message.all.includes(:user).map do |message|
        {
          id: message.id,
          username: message.user.name,
          body: message.body,
        }
      end

      json_response(@messages)
    end
  end
end

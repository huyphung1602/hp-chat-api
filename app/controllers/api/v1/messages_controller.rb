module Api::V1
  class MessagesController < ApplicationController
    def index
      @messages = Message.all
      json_response(@messages)
    end
  end
end
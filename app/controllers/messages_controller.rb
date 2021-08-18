class MessagesController < ApplicationController
  def index
  	@message = Todo.all
  	json_response(@messages)
  end
end

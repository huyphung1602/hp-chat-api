module Api::V1
  class RoomsController < ApplicationController
    before_action :authenticate_user!

    def index
      @rooms = Room.all.includes(:user).map do |room|
        {
          id: room.id,
          name: room.name,
          owner: room.user.name,
        }
      end
      json_response(@rooms)
    end

    def new
      @room = current_user.rooms.new
      json_response(@room)
    end

    def show
      @room = Room.find_by id: params[:id]
      @messages = @room.messages.includes(:user).order(created_at: :asc)
      json_response(@messages)
    end

    def create
      @room = current_user.rooms.new room_params

      if @room.save
        json_response(@room)
      else
        json_response({ errors: 'Something went wrong. Cannot create new room' }, 422)
      end
    end

    private

    def room_params
      params.require(:room).permit :name
    end
  end
end
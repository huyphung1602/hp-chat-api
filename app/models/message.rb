class Message < ApplicationRecord
  belongs_to :user
  belongs_to :room

  after_create_commit :broadcast_to_room_channel

  def broadcast_to_room_channel
    ActionCable.server.broadcast(
      "room_#{self.room.id}_channel",
      {
        id: self.id,
        content: self.content,
        owner: self.user.name,
        room_id: self.room_id,
      }
    )
  end
end

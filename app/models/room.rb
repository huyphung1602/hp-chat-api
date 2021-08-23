class Room < ApplicationRecord
  belongs_to :owner, class_name: 'User', foreign_key: 'user_id'

  has_many :messages, dependent: :destroy

  has_many :room_memberships
  has_many :members, through: :room_memberships, source: :user
end

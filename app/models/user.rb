class User < ApplicationRecord
  has_many :messages, dependent: :destroy
  has_many :owned_rooms, class_name: 'Room'

  has_many :room_memberships, dependent: :destroy
  has_many :joined_rooms, through: :room_memberships, source: :room
  has_many :invitations

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true

  has_secure_password
end

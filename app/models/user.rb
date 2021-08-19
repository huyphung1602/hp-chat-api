class User < ApplicationRecord
  has_many :messages, dependent: :destroy
  has_many :rooms

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true

  has_secure_password
end

class Invitation < ApplicationRecord
  belongs_to :room
  belongs_to :user

  def expired?
    expired_at < Time.current
  end

  def invitation_url
    "#{ENV['BASE_URL']}/invitation?code=#{code}&id=#{id}"
  end
end

class Invitation < ApplicationRecord
  def expired?
    expired_at < Time.current
  end

  def invitation_url
    "#{ENV['BASE_URL']}/invitation?code=#{code}&id=#{id}"
  end
end

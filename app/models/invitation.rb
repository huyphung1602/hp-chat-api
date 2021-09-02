class Invitation < ApplicationRecord
  def expired?
    expired_at < Time.current
  end
end

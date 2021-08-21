module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_user

    def connect
      user_id = cookies.encrypted['_session_id']['user_id']
      self.current_user = User.find_by(id: user_id) || reject_unauthorized_connection
    end
  end
end

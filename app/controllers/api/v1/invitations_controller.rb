module Api::V1
  class InvitationsController < ApplicationController
    before_action :authenticate_user!

    def create
      params.require(:room_id)
      invitation = Invitation.create!(
        user_id: current_user.id,
        code: SecureRandom.alphanumeric(10), 
        room_id: params[:room_id],
        expired_at: Time.current + 14.days,
      )

      json_response(message)
    end
  end
end

module Api::V1
  class InvitationsController < ApplicationController
    before_action :authenticate_user!

    def accept
      params.require([:code, :id])
      invitation = Invitation.find_by(id: id, code: code)

      raise StandardError.new('Invalid Invitation') unless invitation.present?

      if invitation.expired?
        json_response({errors: 'Your invitation link was expired'}, 422)
      else
        RoomMembership.create!(
          user: current_user,
          room: invitation.room,
        )
        json_response(invitation.room)
      end
    end

    def create
      params.require(:room_id)

      lasted_invitation = Invitation.where(room_id: params[:room_id]).order(:created_at).last

      invitation = if lasted_invitation.present? && !lasted_invitation.expired?
        lasted_invitation
      else
        Invitation.create!(
          user_id: current_user.id,
          code: SecureRandom.alphanumeric(10),
          room_id: params[:room_id],
          expired_at: Time.current + 14.days,
        )
      end

      json_response({
        id: invitation.id,
        user_id: invitation.user_id,
        room_id: invitation.room_id,
        expired_at: invitation.expired_at,
        invitation_url: invitation.invitation_url,
      })
    end
  end
end

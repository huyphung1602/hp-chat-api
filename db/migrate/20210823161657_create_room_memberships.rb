class CreateRoomMemberships < ActiveRecord::Migration[6.1]
  def change
    create_table :room_memberships do |t|
      t.references :room, null: false, index: true, foreign_key: true
      t.references :user, null: false, index: true, foreign_key: true

      t.timestamps
    end
  end
end

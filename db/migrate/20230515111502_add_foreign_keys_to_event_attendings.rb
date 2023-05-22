class AddForeignKeysToEventAttendings < ActiveRecord::Migration[7.0]
  def change
    add_reference :event_attendings, :attended_event, index: true, foreign_key: { to_table: :events }
    add_reference :event_attendings, :event_attendee, index: true, foreign_key: { to_table: :users }
  end
end

class AddForeignKeysToEventAttendees < ActiveRecord::Migration[6.0]
  def change
    add_reference :event_attendees, :user, index: true
    add_reference :event_attendees, :event, index: true
  end
end

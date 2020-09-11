class Event < ApplicationRecord
    has_many :attendees, through: :event_attendees, foreign_key: :attendee_id
    belongs_to :creator, class_name: "User"
    has_one_attached :event_image
end

class User < ApplicationRecord
  has_many :events, through: :event_attendees, foreign_key: :event_id
  has_many :created_events, foreign_key: :creator_id, class_name: 'Event'
  has_one_attached :avatar
end

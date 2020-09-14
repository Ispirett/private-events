# frozen_string_literal: true

class Event < ApplicationRecord
  has_many :event_attendees
  has_many :attendees, through: :event_attendees
  belongs_to :creator, class_name: 'User'
  has_one_attached :event_image

  scope :past, -> { where('event_date < ?', Time.now) }
  scope :upcomming, -> { where('event_date > ?', Time.now) }
end

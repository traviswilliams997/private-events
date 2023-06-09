class Event < ApplicationRecord
    belongs_to :creator, class_name: 'User'
    has_many :event_attendings, foreign_key: :attended_event_id, dependent: :destroy
    has_many :attendees, through: :event_attendings, source: :event_attendee

    scope :past, -> {where('date < ?', DateTime.now) }
    scope :future, -> {where('date > ?', DateTime.now) }
 

end

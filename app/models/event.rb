class Event < ApplicationRecord
  belongs_to :creator, class_name: "User", foreign_key: "creator_id"
  has_many :enrollments
  has_many :attendees, through: :enrollments, source: :user

  has_many :invites
  has_many :invited_users, through: :invites, source: :user

  scope :past, -> { where("event_date < ?", Date.current) }

  scope :upcoming, -> { where("event_date >= ?", Date.current) }
end

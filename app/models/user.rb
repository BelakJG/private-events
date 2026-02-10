class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :events, inverse_of: "creator"
  has_many :enrollments
  has_many :attended_events, through: :enrollments, source: :event
  has_many :invites
  has_many :invited_to, through: :invites, source: :event

  scope :others_except, ->(user) { where.not(id: user) }
end

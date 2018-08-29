class Room < ApplicationRecord
  belongs_to :user

  validates :home_type, presence: true
  validates :room_type, presence: true
  validates :accommodate_type, presence: true
  validates :bed_type, presence: true
  validates :bath_type, presence: true
end

class Trip < ApplicationRecord
  has_many :trip_users, dependent: :destroy
  has_many :users, through: :trip_users
  has_many :trip_transportations, dependent: :destroy
  has_many :transportations, through: :trip_transportations
  has_many :trip_events, dependent: :destroy
  has_many :events, through: :trip_events
  has_many :trip_accomodations, dependent: :destroy
  has_many :accomodations, through: :trip_accomodations


end

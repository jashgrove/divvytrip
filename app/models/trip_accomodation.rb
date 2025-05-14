class TripAccomodation < ApplicationRecord
  belongs_to :trip
  belongs_to :accomodation
end

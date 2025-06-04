class AccomodationUser < ApplicationRecord
  belongs_to :accomodation
  belongs_to :user

  validates :accomodation_id, presence: true
  validates :user_id, presence: true
  validates :user_id, uniqueness: { scope: :accomodation_id, message: "has already been assigned to this accomodation" }
end

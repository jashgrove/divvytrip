class Accomodation < ApplicationRecord
  belongs_to :trip
  has_many :accomodation_users, dependent: :destroy
  has_many :users, through: :accomodation_users, source: :user
end

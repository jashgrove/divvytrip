class Transportation < ApplicationRecord
  has_many :transportation_users, dependent: :destroy
  has_many :users, through: :transportation_users
end

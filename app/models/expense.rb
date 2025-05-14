class Expense < ApplicationRecord
  belongs_to :trip
  belongs_to :paid_by_user
  belongs_to :expenseable
end

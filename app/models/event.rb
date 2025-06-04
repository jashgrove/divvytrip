class Event < ApplicationRecord
  belongs_to :user
  has_many :event_users, dependent: :destroy
  has_many :users, through: :event_users, source: :user

  validates :title, presence: true
  validates :description, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true
  validate :end_time_after_start_time

  private

  def end_time_after_start_time
    return if end_time.blank? || start_time.blank?

    if end_time <= start_time
      errors.add(:end_time, "must be after the start time")
    end
  end
end

class Truck < ApplicationRecord
  extend Format

  validates :name, presence: true, uniqueness: true
  validates :start_time, :end_time, presence: true
  validates_numericality_of :end_time,
    greater_than: ->(truck) { truck.start_time },
    message: "must be after start time."

  has_many :jobs

  scope :availability, ->(time, est_end_time) do
    where(arel_attribute(:start_time).lteq(time))
      .where(arel_attribute(:end_time).gteq(est_end_time))
  end

  def format_time(start_time, end_time)
    self.start_time = Truck.time_to_i(start_time[:hour], start_time[:min])
    self.end_time = Truck.time_to_i(end_time[:hour], end_time[:min])
  end
end

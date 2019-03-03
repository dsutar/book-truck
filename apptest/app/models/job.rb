class Job < ApplicationRecord
  extend Format

  validates :customer_name, :date, :duration,
            :start_time, :est_end_time, presence: true
  validates :truck, presence: { message: "not available for your requested time! Please try again." }

  attr_accessor :time

  after_initialize :format_time, :assign_truck, if: :new_record?

  belongs_to :truck, optional: true

  def find_conflicts
    table = Job.arel_table

    Job.where(
      table[:id].not_eq(id)
      .and(table[:date].eq(date))
      .and(
        table[:start_time].in(start_time...est_end_time)
        .or(
          table[:est_end_time].in((start_time + 1)..est_end_time))
        .or(
          table[:start_time].lteq(start_time)
          .and(table[:est_end_time].gteq(est_end_time))
        )
      )
    )
  end

  private

  def format_time
    self.start_time = Job.time_to_i(time[:hour], time[:min])
    self.est_end_time = start_time + (duration * 3600)
  end

  def assign_truck
    self.truck_id = find_available_trucks.pluck(:id).first
  end

  def find_available_trucks
    Truck.availability(start_time, est_end_time)
      .left_joins(:jobs)
      .where.not(id: find_conflicts.pluck(:truck_id))
      .group(:id).order('COUNT(jobs.id) DESC')
  end
end

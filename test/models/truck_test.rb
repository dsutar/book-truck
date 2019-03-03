require 'test_helper'

class TruckTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  def setup
    @truck = Truck.new(name: "Truck1", start_time: "7:00 am", end_time: "7:00 pm")
  end

  test "should be valid" do
    assert @truck.valid?
  end

end


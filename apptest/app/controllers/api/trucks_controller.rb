class Api::TrucksController < ApplicationController
  def create
    @truck = Truck.new(truck_params)
    @truck.format_time(time_params[:start_time], time_params[:end_time])

    if @truck.save
      render :show
    else
      render json: @truck.errors.full_messages, status: :unprocessable_entity
    end
  end

  def index
    @trucks = Truck.all
    render :index
  end

  private

  def truck_params
    params.require(:truck).permit(:name)
  end

  def time_params
    params.require(:truck).permit(start_time: [:hour, :min], end_time: [:hour, :min])
  end
end

class Api::JobsController < ApplicationController
  def create
    @job = Job.new(job_params)
    if @job.save
      render :show
    else
      render json: @job.errors.full_messages, status: 409
    end
  end

  private

  def job_params
    params.require(:job).permit(:customer_name, :date, :duration, time: [:hour, :min])
  end
end

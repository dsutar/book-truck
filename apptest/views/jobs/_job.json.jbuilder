json.extract! job, :id, :name, :move_date, :start_time, :duration, :created_at, :updated_at
json.url job_url(job, format: :json)

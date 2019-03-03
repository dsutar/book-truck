job_ids = truck.jobs.map { |job| job[:id] }


json.extract! truck, :id, :name, :start_time, :end_time
json.jobs do
  json.array! job_ids
end

json.trucks({})
json.jobs({})

jobs = []

json.trucks do
  @trucks.each do |truck|
    json.set! truck.id do
      json.partial! 'api/trucks/truck', truck: truck
    end
    
    jobs += truck.jobs
  end
end

json.jobs do
  jobs.each do |job|
    json.set! job.id do
      json.partial! 'api/jobs/job', job: job
    end
  end
end

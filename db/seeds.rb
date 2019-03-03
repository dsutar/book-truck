# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Truck.create(
    name: "Truck A",
    start_time: Time.find_zone('Pacific Time (US & Canada)').local(2000, 1, 1, 9, 0, 0, 0).to_i,
    end_time: Time.find_zone('Pacific Time (US & Canada)').local(2000, 1, 1, 20, 0, 0, 0).to_i
  )
  Truck.create(
    name: "Truck B",
    start_time: Time.find_zone('Pacific Time (US & Canada)').local(2000, 1, 1, 6, 0, 0, 0).to_i,
    end_time: Time.find_zone('Pacific Time (US & Canada)').local(2000, 1, 1, 13, 0, 0, 0).to_i
  )
  Truck.create(
    name: "Truck C",
    start_time: Time.find_zone('Pacific Time (US & Canada)').local(2000, 1, 1, 7, 0, 0, 0).to_i,
    end_time: Time.find_zone('Pacific Time (US & Canada)').local(2000, 1, 1, 16, 0, 0, 0).to_i
  )
  
  Job.create(
    customer_name: "Customer A",
    date: "2018/5/30",
    time: { hour: 9, min: 0 },
    duration: 3
  )
  Job.create(
    customer_name: "Customer B",
    date: "2018/5/30",
    time: { hour: 6, min: 30 },
    duration: 3
  )
  Job.create(
    customer_name: "Customer C",
    date: "2018/5/30",
    time: { hour: 12, min: 0 },
    duration: 7
  )
  Job.create(
    customer_name: "Customer D",
    date: "2018/5/30",
    time: { hour: 13, min: 0 },
    duration: 2
  )
  
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
unless User.exists?(role: :patient)
  user = User.create!(first_name: 'Hasaan', last_name: 'Mahmood', email: 'devhassanmahmood@gmail.com', password: '12345678', role: :patient)
  user.save!
  
  90.times do |record|
  	user.glucose_readings.create!(level: record + 20, created_at: record.day.ago)
  	user.glucose_readings.create!(level: record + 25, created_at: record.day.ago + 4.hours)
  	user.glucose_readings.create!(level: record + 30, created_at: record.day.ago + 8.hours)
  	user.glucose_readings.create!(level: record + 35, created_at: record.day.ago + 12.hours)
  end
end
puts 'cleaning database'
Walker.destroy_all
puts 'creating new database'
5.times do
  Walker.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    phone_number: Faker::PhoneNumber.phone_number,
  )
end
puts 'New databse created'

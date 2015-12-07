puts "===> Seeding the Development Database <===\n=========================================="

# controls
#################################################
vet_count = 10

# local user accounts
#################################################
Vet.where(email: 'vet@qa.com').first_or_create(
  email: 'vet@qa.com',
  password: 'password',
  first_name: 'Arnold',
  last_name: 'McTester',
  address: '187 Test Ln.',
  city: 'San Francisco',
  state: 'CA',
  zip: '94101',
  confirmed_at: DateTime.current
)

# vets
#################################################
unless Vet.count >= vet_count
  puts "-> BEGIN: creating #{vet_count} Vets"
  vet_count.times do
    Vet.create(
      email: Faker::Internet.email,
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name,
      address: Faker::Address.street_address,
      address_2: [nil, Faker::Address.secondary_address].sample,
      city: Faker::Address.city,
      state: Faker::Address.state_abbr,
      zip: Faker::Address.zip[0..4],
      confirmed_at: DateTime.current,
      password: "password"
    )
  end
  puts "-> DONE: creating #{vet_count} Vets"
end

# this should be the last line of the seed file! do not
# output anything else to the console
puts "\n===> Vet account: 'vet@qa.com', password: 'password'"

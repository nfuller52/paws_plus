FactoryGirl.define do
  factory :vet do
    sequence(:email, 1000) { |n| "vet-#{n}@qa.com" }
    first_name "Tom"
    last_name "Brady"
    address "1 Patriot Pl"
    city "Foxborough"
    state "MA"
    zip "02035"
    distance_willing_to_travel 10
    password "password"
  end
end

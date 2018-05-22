FactoryBot.define do
  factory :scratcher do
    name { Faker::Lorem.word }
    description { Faker::Lorem.sentence }
    size { Faker::Dog.size }
    price { Faker::Number.decimal(3, 2) }
  end
end

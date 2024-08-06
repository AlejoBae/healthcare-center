FactoryBot.define do
  factory :user do
    full_name { Faker::Lorem.characters }
    phone { Faker::Number.number(digits: 10) }
    email { Faker::Internet.email }
    password { Faker::Internet.password }
  end
end

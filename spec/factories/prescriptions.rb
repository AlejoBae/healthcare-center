FactoryBot.define do
  factory :prescription do
    prescript { Faker::Lorem.characters }
    appointment
  end
end

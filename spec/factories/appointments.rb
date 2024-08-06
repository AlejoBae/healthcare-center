FactoryBot.define do
  factory :appointment do
    appointment_date { Faker::Date }
    user
    doctor
  end
end

FactoryBot.define do
  factory :reservation do
    start_date { Faker::Date.in_date_period }
    stay_days { 2 }
    one_day_hours { 3 }
    message { Faker::Lorem.sentence }
    association :user
    association :house
  end
end

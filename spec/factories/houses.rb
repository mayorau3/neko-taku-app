FactoryBot.define do
  factory :house do
    pr { Faker::Lorem.sentence }
    explanation { Faker::Lorem.sentence }
    cat_history_id { 6 }
    character { 7 }
    one_day_price { 500 }
    stay_price { 3500 }
    association :user

    after(:build) do |house|
      house.images.attach(io: File.open('public/images/test_image1.png'), filename: 'test_image1.png')
      house.images.attach(io: File.open('public/images/test_image2.png'), filename: 'test_image2.png')
    end
  end
end

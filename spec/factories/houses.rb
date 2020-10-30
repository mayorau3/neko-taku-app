FactoryBot.define do
  factory :house do
    pr { Faker::Lorem.sentence }
    explanation { Faker::Lorem.sentence }
    cat_history_id { 6 }
    chara_stay { 1 }
    chara_5min { 1 }
    chara_house { 1 }
    chara_floor { 1 }
    chara_weekend { 1 }
    chara_weekday { 1 }
    chara_have_cat { 1 }
    chara_tower { 1 }
    chara_camera { 1 }
    one_day_price { 500 }
    stay_price { 3500 }
    association :user

    after(:build) do |house|
      house.images.attach(io: File.open('public/images/test_image1.png'), filename: 'test_image1.png')
      house.images.attach(io: File.open('public/images/test_image2.png'), filename: 'test_image2.png')
    end
  end
end

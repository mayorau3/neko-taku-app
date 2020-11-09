FactoryBot.define do
  factory :cat do
    name { Faker::Name.last_name }
    age_id { 6 }
    sex { 2 }
    chara_clever { 1 }
    chara_sleep { 1 }
    chara_active { 1 }
    chara_quiet { 1 }
    chara_greedy { 1 }
    chara_lonely { 1 }
    chara_own { 1 }
    explanation { Faker::Lorem.sentence }
    association :user

    after(:build) do |cat|
      cat.images.attach(io: File.open('public/images/test_image3.jpg'), filename: 'test_image3.jpg')
      cat.images.attach(io: File.open('public/images/test_image4.jpg'), filename: 'test_image4.jpg')
    end
  end
end

FactoryBot.define do
  factory :user do
    nickname { Faker::Name.last_name }
    email { Faker::Internet.free_email }
    password = Faker::Internet.password(min_length: 8)
    password { password }
    password_confirmation { password }
    kanji_family_name { '名字かんじゼンカク' }
    kanji_first_name { '名まえテスト' }
    zip_code { '123-4567' }
    region_id { 2 }
    city { '札幌市' }
    address1 { '本町1ー1' }
    address2 { 'レジデンス青山302' }
    phone { '08012345678' }
  end
end

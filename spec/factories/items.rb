FactoryBot.define do
  factory :item do
    name           { Faker::Name.name }
    category_id    { Faker::Number.within(range: 1..10) }
    price          { Faker::Number.within(range: 300..9_999_999) }
    description    { Faker::Lorem.word }
    condition_id   { Faker::Number.within(range: 1..6) }
    delv_fee_id    { Faker::Number.within(range: 1..2) }
    delv_time_id   { Faker::Number.within(range: 1..3) }
    prefecture_id  { Faker::Number.within(range: 1..47) }
    association :user
  end
end

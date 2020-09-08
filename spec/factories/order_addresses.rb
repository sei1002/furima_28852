FactoryBot.define do
  factory :order_address do
    token          { 'aaaaaaaa' }
    postal_code    { '123-4567' }
    prefecture_id  { Faker::Number.within(range: 1..47) }
    city           { '大阪市' }
    address        { '大阪1ー1ー1' }
    build_name     { '大阪ビル' }
    tel            { '09012345678' }
    association :user
    association :item
  end
end

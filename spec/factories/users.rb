FactoryBot.define do
  factory :user do
    nickname              { 'セイ' }
    email                 { 'aaaa@gmail.com' }
    password              { 'aaaa111' }
    password_confirmation { 'aaaa111' }
    first_name            { '成' }
    last_name             { '中田' }
    kana_last             { 'ナカタ' }
    kana_first            { 'セイ' }
    birthday              { Faker::Date.birthday }
  end
end

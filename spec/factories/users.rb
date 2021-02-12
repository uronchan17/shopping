FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {"111aaa"}
    password_confirmation {password}
    phone_number          {Faker::Number.leading_zero_number(digits: 10)}
    country_id            {2}
    user_level            {1}
  end
end
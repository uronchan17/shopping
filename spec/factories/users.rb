FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    phone_number          {Faker::Number.leading_zero_number(digits: 10)}
    country_id            {2}
  end
end
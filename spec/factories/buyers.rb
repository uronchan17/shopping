FactoryBot.define do
  factory :buyer do
    area_id { 2 }
    total_fee { 100000 }
    payment_id { 2 }
    association :user
  end
end
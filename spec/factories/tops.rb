FactoryBot.define do
  factory :top do
    items { Faker::Food.description }
    price { 100 }
    explain { "お菓子です" }
    stock { 100 }
    category_id { 2 }
  end
end

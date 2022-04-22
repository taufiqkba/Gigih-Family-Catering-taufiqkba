FactoryBot.define do
  factory :menu do
    name { Faker::Food.dish }
    description { Faker::Food.description }
    price { Faker::Commerce.price }
  end
end

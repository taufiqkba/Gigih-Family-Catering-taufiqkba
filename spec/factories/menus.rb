FactoryBot.define do
  factory :menu do
    name { Faker::Food.dish }
    description { Faker::Food.measurement }
    price { Faker::Commerce.price }
  end
end

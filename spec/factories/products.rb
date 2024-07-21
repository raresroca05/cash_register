FactoryBot.define do
  factory :product do
    sequence(:code) { |n| "GR#{n}" }
    name { "Green Tea" }
    price { 3.11 }
  end
end

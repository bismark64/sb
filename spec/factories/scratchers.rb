FactoryGirl.define do
  factory :scratcher do
    name{ Faker::Product.product_name }
    size{ rand(99).to_s }
    color{ Faker::Product.product_name }
    cost{ rand(999).to_s }
  end
end

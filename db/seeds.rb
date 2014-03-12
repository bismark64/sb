require "ffaker"

100.times do
  Scratcher.create(
    name: Faker::Product.product_name,
    cost: rand(999),
    size: rand(99),
    color: Faker::Product.product_name
  )
end
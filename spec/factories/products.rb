FactoryGirl.define do
  factory :product do
    name "Peanut milk"
    ingredients "Peanuts"
    ingredients_amount_per_recipe 150
    amount_type "grams"
    ingredients_cost_per_unit 5
    unit_type "kilos"
    min_amount 150
    product_price 4
    product_cost 1
    user
  end

  factory :second_product, class: "Product" do
    name "Almond milk"
    ingredients "Almonds"
    ingredients_amount_per_recipe 200
    amount_type "grams"
    ingredients_cost_per_unit 40
    unit_type "kilos"
    min_amount 150
    product_price 9
    product_cost 4.5
    user
  end
end

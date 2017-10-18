FactoryGirl.define do
  factory :recipe do
    product_id 1
    ingredient_id 1
    amount 1
    amount_type "kilos"
    user
    product
    ingredient
  end

  factory :second_recipe, class: "Recipe" do
    product_id 1
    ingredient_id 2
    amount 1
    amount_type "kilos"
    user
    product
    ingredient
  end
end

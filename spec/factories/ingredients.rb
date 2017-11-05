FactoryGirl.define do
  factory :ingredient do
    product "Peanut Milk"
    name "Peanuts"
    amount 1
    amount_type "kilos"
    min_amount 150
    min_amount_type "grams"
    user
  end

  factory :second_ingredient, class: "Ingredient" do
    name "Almonds"
    amount 1
    amount_type "kg"
    min_amount 200
    min_amount_type "grams"
    user
  end
end

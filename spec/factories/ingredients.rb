FactoryGirl.define do
  factory :ingredient do
    name "Peanuts"
    amount 1
    amount_type "kg"
    min_amount 150
  end

  factory :second_ingredient, class: "Ingredient" do
    name "Almonds"
    amount 1
    amount_type "kg"
    min_amount 200
  end
end

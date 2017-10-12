FactoryGirl.define do
  factory :product do
    name "Peanut milk"
    amount 1
    price 4
    cost 1
    user
  end

  factory :second_product, class: "Product" do
    name "Almond milk"
    amount 2
    price 9
    cost 2
    user
  end
end

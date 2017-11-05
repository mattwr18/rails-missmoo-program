FactoryGirl.define do
  factory :product do
    name "Peanut milk"
    price 4
    cost 1
    user
  end

  factory :second_product, class: "Product" do
    name "Almond milk"
    price 9
    cost 4.5
    user
  end
end

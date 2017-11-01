require 'rails_helper'

RSpec.describe Product, type: :model do
  [:name, :product_price,
    :product_cost, :product_cost,
    :user_id, :ingredients, :ingredients_amount_per_recipe,
    :amount_type, :ingredients_cost_per_unit, :product_price].each do |attribute|
      it { should validate_presence_of(attribute) }
    end
    [:product_cost, :product_price].each do |attribute|
      it { should validate_numericality_of(attribute).is_greater_than(0.0) }
    end
      it { should validate_numericality_of(:amount).is_greater_than_or_equal_to(0.0) }
  end

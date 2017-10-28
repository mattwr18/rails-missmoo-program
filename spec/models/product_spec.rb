require 'rails_helper'

RSpec.describe Product, type: :model do
  describe "creation" do
    before do
      @product = FactoryGirl.create(:product)
    end

    it "can be created" do
      expect(@product).to be_valid
    end

    it "cannot be created without a name, cost, price, or user id" do
      @product.name = nil
      @product.product_price = nil
      @product.product_cost = nil
      @product.user_id = nil
      expect(@product).to_not be_valid
    end

    it "cannot be created without ingredients, amount per recipe, amount type, cost per unit, min amount" do
      @product.ingredients = nil
      @product.ingredients_amount_per_recipe = nil
      @product.amount_type = nil
      @product.ingredients_cost_per_unit = nil
      @product.min_amount = nil
      expect(@product).to_not be_valid
    end

    it 'has an amount, cost, and price greater than 0.0' do
       @product.product_cost = 0.0
       @product.product_price = 0.0
       expect(@product).to_not be_valid
    end
  end
end

require 'rails_helper'

RSpec.describe Product, type: :model do
  describe "creation" do
    before do
      @product = FactoryGirl.create(:product)
    end

    it "can be created" do
      expect(@product).to be_valid
    end

    it "cannot be created without a name, amount, cost, and price" do
      @product.name = nil
      @product.amount = nil
      @product.price = nil
      @product.cost = nil

      expect(@product).to_not be_valid
    end

    it 'has an amount, cost, and price greater than 0.0' do
       @product.amount = 0
       @product.cost = 0.0
       @product.price = 0.0
       expect(@product).to_not be_valid
    end
  end
end

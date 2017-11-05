require 'rails_helper'

RSpec.describe Ingredient, type: :model do
  describe "creation" do
    before do
      @product = FactoryGirl.create(:product)
      @ingredient = FactoryGirl.create(:ingredient, product_id: @product.id)
    end

    it "can be created" do
      expect(@ingredient).to be_valid
    end
    context 'cannot be created without' do
      it "a name, amount, amount_type, and minimum amount" do
        @ingredient.name = nil
        @ingredient.amount = nil
        @ingredient.amount_type = nil
        @ingredient.min_amount = nil

        expect(@ingredient).to_not be_valid
      end

      it 'an amount or minimum amount of greater than 0.0' do
         @ingredient.amount = 0
         @ingredient.min_amount = 0.0

         expect(@ingredient).to_not be_valid
      end
    end
  end
end

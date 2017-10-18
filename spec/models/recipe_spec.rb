require 'rails_helper'

RSpec.describe Recipe, type: :model do
  describe "creation" do
    before do
      @recipe = FactoryGirl.create(:recipe)
    end

    it "can be created" do
      expect(@recipe).to be_valid
    end

    context 'cannot be created without' do
      it "a product_id, ingredient_id, amount_type, and amount" do
        @recipe.product_id = nil
        @recipe.ingredient_id = nil
        @recipe.amount_type = nil
        @recipe.amount = nil

        expect(@recipe).to_not be_valid
      end

      it 'an amount greater than 0' do
         @recipe.amount = 0

         expect(@recipe).to_not be_valid
      end
    end
  end
end

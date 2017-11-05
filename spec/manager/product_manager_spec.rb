require 'rails_helper'

RSpec.describe ProductManager do
  let(:product) { FactoryGirl.create(:product) }
  let(:user) { FactoryGirl.create(:user) }
  let(:ingredient) { FactoryGirl.create(:ingredient) }

  describe "#create_ingredients" do
    it "should populate product ingredient set" do
      expect do
        described_class.new(user, product, ingredient).create_ingredients
      end.to change(Ingredient, :count).by(2)
    end
  end

  describe "#create_recipes" do
    it "should populate product recipes" do
      expect do
        described_class.new(user, product, ingredient).create_recipes
      end.to change(Recipe, :count).by(1)
    end
  end
end

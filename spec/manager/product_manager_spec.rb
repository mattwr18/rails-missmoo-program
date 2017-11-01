require 'rails_helper'

RSpec.describe ProductManager do
  let(:product) { FactoryGirl.create(:product) }
  let(:user) { FactoryGirl.create(:user) }

  describe "#create_ingredients" do
    it "should populate product ingredient set" do
      expect do
        described_class.new(user, product).create_ingredients
      end.to change(Ingredient, :count).by(1)
    end
  end
end

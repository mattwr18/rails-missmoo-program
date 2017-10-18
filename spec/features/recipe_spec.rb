require 'rails_helper'

describe 'navigation' do
  let(:user) { FactoryGirl.create(:user) }

  before do
    login_as(user, :scope => :user)
    visit recipes_path
  end

  context 'when reached' do
    it 'successfully' do
      expect(page.status_code).to eq(200)
    end

    it 'from the homepage' do
      visit root_path
      click_on("recipes_from_nav")

      expect(page.status_code).to eq(200)
    end
  end

  context 'when navigated to' do
    it 'has a title of Recipes' do
      expect(page).to have_css("h1", text: /Recipes/)
    end

    xit 'has a list of Recipes' do
      recipe1 = FactoryGirl.create(:recipe)
      recipe2 = FactoryGirl.create(:second_recipe)

      visit recipes_path
      expect(page).to have_content()
    end
  end

  describe 'creation' do
    before do
      visit new_recipe_path
    end

    it 'has a form that can be reached' do
      expect(page.status_code).to eq(200)
    end

    it 'allows recipes to be created' do
      product1 = FactoryGirl.create(:product)
      ingredient1 = FactoryGirl.create(:ingredient)
      visit new_recipe_path
      select "Peanut milk", from: "recipes_product_id"
      select "Peanuts", from: "recipes_ingredient_id"
      fill_in 'Amount', with: 150
      select "grams", from: "recipes_amount_type"

      expect { click_on "Create Recipe" }.to change(Recipe, :count).by(1)
    end
  end
end

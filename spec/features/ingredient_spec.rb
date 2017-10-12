require 'rails_helper'

describe 'navigation' do
  let(:user) { FactoryGirl.create(:user) }

  let(:product) do
    Ingredient.create(name: "Peanut milk", amount: 1, cost: 1, price: 1, user_id: user.id)
  end

  before do
    login_as(user, :scope => :user)
    visit ingredients_path
  end

  context 'can be reached' do
    it 'successfully' do
      expect(page.status_code).to eq(200)
    end

    it 'from the homepage' do
      visit root_path
      click_on("new_ingredient_from_nav")
      expect(page.status_code).to eq(200)
    end
  end

  context 'when navigated to' do
    it 'has a title of Ingredients' do
      expect(page).to have_content(/Ingredients/)
    end

    it 'has a list of Ingredients' do
      ingredient1 = FactoryGirl.create(:ingredient)
      ingredient2 = FactoryGirl.create(:second_ingredient)
      
      visit ingredients_path
      expect(page).to have_content(/Peanuts|Almonds/)
    end
  end

end

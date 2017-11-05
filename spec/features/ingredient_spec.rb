require 'rails_helper'

describe 'navigation' do
  let(:user) { FactoryGirl.create(:user) }
  let(:product) { FactoryGirl.create(:product) }
  let(:ingredient) do
    Ingredient.create(name: "Peanuts", amount: 5, amount_type: "kilos", min_amount: 1, min_amount_type: "grams", user_id: user.id, product_id: product.id)
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
      click_on("ingredients_from_nav")
      expect(page.status_code).to eq(200)
    end
  end

  context 'when navigated to' do
    it 'has a title of Ingredients' do
      expect(page).to have_css("h1", text: /Ingredients/)
    end

    it 'has a list of Ingredients' do
      ingredient1 = FactoryGirl.create(:ingredient, user_id: user.id, product_id: product.id)
      ingredient2 = FactoryGirl.create(:second_ingredient, user_id: user.id, product_id: product.id)

      visit ingredients_path
      expect(page).to have_content(/Peanuts|Almonds/)
    end
  end

  describe 'creation' do
    before do
      visit new_ingredient_path
    end

    it 'has a form that can be reached' do
      expect(page.status_code).to eq(200)
    end

    it 'allows an ingredient to be created' do
      select "Peanut Milk", from: "ingredient_product_id"
      fill_in 'Name', with: "Yams"
      fill_in 'Amount', with: 500
      select("grams", from: "ingredient_amount_type")
      fill_in 'Min amount', with: 500
      select("grams", from: "ingredient_min_amount_type")

      expect { click_on "Create Ingredient" }.to change(Ingredient, :count).by(1)
    end

    it 'will have a user associated with it' do
      fill_in 'Name', with: "Yams"
      fill_in 'Amount', with: 500
      select("grams", from: "ingredient_amount_type")
      fill_in 'Min amount', with: 500
      select("grams", from: "ingredient_min_amount_type")

      click_on("Create Ingredient")
      expect(User.last.ingredients.last.name).to eq("Yams")
    end
  end

  describe 'delete' do
    it 'can be deleted' do
      logout(:user)

      delete_user = FactoryGirl.create(:user)
      login_as(delete_user, :scope => :user)

      ingredient_to_delete = FactoryGirl.create(:ingredient, user_id: delete_user.id, product_id: product.id)

      visit ingredients_path

      click_link("delete_ingredient_#{ingredient_to_delete.id}_from_index")
      expect(page.status_code).to eq(200)
    end
  end

  describe 'edit' do
    it 'can be edited' do
      visit edit_ingredient_path(ingredient)

      fill_in 'Name', with: "Linseeds"
      fill_in 'Amount', with: 45

      click_on("Update")
      expect(page).to have_content("Linseeds")
    end
  end
end

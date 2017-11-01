require 'rails_helper'

describe 'navigation' do
  let(:user) { recipe.user }

  let(:recipe) { FactoryGirl.create(:recipe) }

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

    it 'has a list of Recipes' do
      recipe1 = FactoryGirl.create(:recipe)
      recipe2 = FactoryGirl.create(:second_recipe)

      visit recipes_path
      expect(page).to have_content()
    end

  it 'only allows recipe creators to see their recipes' do
    other_user = User.create(email: "test2@test.com", password: "asdfasdf", password_confirmation: "asdfasdf", first_name: "Danaerys", last_name: "Targaryen", username: "TheDragonsMother")
    product_other_user = Product.create(name: "This product shouldn't be seen",
                                        product_price: 2,
                                        product_cost: 2,
                                        ingredients: "Peanuts",
                                        ingredients_amount_per_recipe: 150,
                                        amount_type: "grams",
                                        ingredients_cost_per_unit: 5,
                                        unit_type: "kilos",
                                        min_amount: 150,
                                        user_id: other_user.id)
    ingredient_other_user = Ingredient.create(name: "Peanuts", amount: 1, amount_type: "kilos", min_amount: 150, min_amount_type: "grams", user_id: other_user.id)
    recipe_other_user = Recipe.create(product_id: product_other_user.id, ingredient_id: ingredient_other_user.id, amount: 2, amount_type: "grams", user_id: other_user.id)

    visit recipes_path

    expect(page).to_not have_content(/This recipe shouldn't be seen/)
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
      select "Peanut milk", from: "recipes_product_id"
      select "Peanuts", from: "recipes_ingredient_id"
      fill_in 'Amount', with: 150
      select "grams", from: "recipes_amount_type"

      expect { click_on "Create Recipe" }.to change(Recipe, :count).by(1)
    end

    it 'will have a user associated with it' do
      select "Peanut milk", from: "recipes_product_id"
      select "Peanuts", from: "recipes_ingredient_id"
      fill_in 'Amount', with: 150
      select "grams", from: "recipes_amount_type"

      click_on("Create Recipe")
      expect(Recipe.last.user_id).to eq(user.id)
    end
  end

  describe 'delete' do
    it 'can be deleted' do
      logout(:user)

      delete_user = FactoryGirl.create(:user)
      login_as(delete_user, :scope => :user)

      recipe_to_delete = FactoryGirl.create(:recipe, user_id: delete_user.id)

      visit recipes_path

      click_link("delete_recipe_#{recipe_to_delete.id}_from_index")
      expect(page.status_code).to eq(200)
    end
  end

  describe 'edit' do
    it 'can be edited' do
      visit edit_recipe_path(recipe)

      fill_in "Amount", with: 200

      click_on("Update")
      expect(page).to have_content(200)
    end
  end
end

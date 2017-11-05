require 'rails_helper'

describe 'navigation' do
  let(:user) { FactoryGirl.create(:user) }

  let(:product) do
    Product.create(name: "Peanut milk", price: 2, cost: 2, user_id: user.id)
  end

  before do
    login_as(user, :scope => :user)
  end

  describe 'index' do
    before do
      visit products_path
    end

    context 'can be reached' do
      it 'successfully' do
        expect(page.status_code).to eq(200)
      end

      it 'from the homepage' do
        visit root_path
        click_on("products_from_nav")
        expect(page.status_code).to eq(200)
     end
   end

    it 'has a title of Products' do
      expect(page).to have_css("h1", text: /Products/)
    end

    it 'has a list of products' do
      product1 = FactoryGirl.create(:product, user_id: user.id)
      product2 = FactoryGirl.create(:product, user_id: user.id)

      visit products_path
      expect(page).to have_content(/Peanut|Almond/)
    end

    it 'only allows product creators to see their products' do
      other_user = User.create(email: "test2@test.com", password: "asdfasdf", password_confirmation: "asdfasdf", first_name: "Danaerys", last_name: "Targaryen", username: "TheDragonsMother")
      product_other_user = Product.create(name: "This product shouldn't be seen", price: 2, cost: 2, user_id: other_user.id)

      visit products_path

      expect(page).to_not have_content(/This product shouldn't be seen/)
    end
  end

  describe 'creation' do
    before do
      visit new_product_path
    end

    it 'has a form that can be reached' do
      expect(page.status_code).to eq(200)
    end

    it 'allows a product to be created' do
      fill_in 'Name', with: "Yam milk"
      fill_in 'price', with: 4
      fill_in 'cost', with: 1

      expect { click_on "Create Product" }.to change(Product, :count).by(1)
    end

    it 'will have a user associated with it' do
      fill_in 'Name', with: "Vegan milk"
      fill_in 'product[price]', with: 4
      fill_in 'product[cost]', with: 1

      click_on("Create Product")
      expect(User.last.products.last.name).to eq("Vegan milk")
    end

    it 'will have a link to add ingredients and recipes' do
      click_on "Add Ingredient"
      expect(page.status_code).to eq(200)
    end
  end

  describe 'delete' do
    it 'can be deleted' do
      logout(:user)

      delete_user = FactoryGirl.create(:user)
      login_as(delete_user, :scope => :user)

      product_to_delete = FactoryGirl.create(:product, user_id: delete_user.id)

      visit products_path
      click_link("delete_product_#{product_to_delete.id}_from_index")
      expect(page.status_code).to eq(200)
    end
  end

  describe 'edit' do
    it 'can be edited' do
      visit edit_product_path(product)

      fill_in 'Name', with: "Vegan milk"
      fill_in 'product[price]', with: 10

      click_on("Update Product")
      expect(page).to have_content("Vegan")
    end

    it 'cannot be edited by a non authorized user' do
      logout(:user)
      non_authorized_user = FactoryGirl.create(:non_authorized_user)
      login_as(non_authorized_user, :scope => :user)
      visit edit_product_path(product)

      expect(current_path).to eq(root_path)
    end
  end
end

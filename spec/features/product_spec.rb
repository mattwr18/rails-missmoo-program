require 'rails_helper'

describe 'navigation' do
  let(:user) { FactoryGirl.create(:user) }

  let(:product) do
    Product.create(name: "Peanut milk", amount: 1, cost: 1, price: 1, user_id: user.id)
  end

  before do
    login_as(user, :scope => :user)
  end

  describe 'index' do
    before do
      visit products_path
    end

    it 'can be reached successfully' do
      expect(page.status_code).to eq(200)
    end

    it 'has a title of Products' do
      expect(page).to have_content(/Products/)
    end

    it 'has a list of products' do

      product1 = FactoryGirl.create(:product)
      product2 = FactoryGirl.create(:second_product)
      visit products_path

      expect(page).to have_content(/Peanut|Almond/)
    end

    xit 'only allows product creators to see their products' do
      other_user = User.create(email: "test2@test.com", password: "asdfasdf", password_confirmation: "asdfasdf", first_name: "Danaerys", last_name: "Targaryen", username: "TheDragonsMother")
      product_other_user = Product.create(name: "This product shouldn't be seen", amount: 2, price: 2, cost: 2, user_id: other_user.id)

      visit products_path

      expect(page).to_not have_content(/This product shouldn't be seen/)
    end
  end
end

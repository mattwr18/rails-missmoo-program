require 'rails_helper'

describe 'navigation' do
  let(:user) { FactoryGirl.create(:user) }

  it 'can be reached successfully' do
      login_as(user, :scope => :user)
      visit ingredients_path
      expect(page.status_code).to eq(200)
  end
end

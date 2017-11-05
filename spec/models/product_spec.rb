require 'rails_helper'

RSpec.describe Product, type: :model do
  [:name, :price,
    :cost, :user_id].each do |attribute|
      it { should validate_presence_of(attribute) }
    end
    [:cost, :price].each do |attribute|
      it { should validate_numericality_of(attribute).is_greater_than(0.0) }
    end
      it { should validate_numericality_of(:amount).is_greater_than_or_equal_to(0.0) }
  end

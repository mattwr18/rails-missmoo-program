class Recipe < ApplicationRecord
belongs_to :user
belongs_to :product
belongs_to :ingredient

validates_presence_of :product_id, :ingredient_id, :amount_type, :amount, :user_id

validates :amount, presence: true, numericality: { greater_than: 0 }
end

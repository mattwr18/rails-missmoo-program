class Ingredient < ApplicationRecord
belongs_to :user
belongs_to :product
has_many :recipes

validates_presence_of :name, :amount_type, :min_amount_type, :user_id, :product_id

validates :amount, :min_amount, presence: true, numericality: { greater_than: 0.0 }

scope :ingredients_by, ->(user) { where(user_id: user.id) }
end

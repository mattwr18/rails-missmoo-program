class Ingredient < ApplicationRecord
belongs_to :user
has_many :products

validates_presence_of :name, :amount, :amount_type, :min_amount, :user_id

validates :amount, :min_amount, numericality: { greater_than: 0.0 }

scope :ingredients_by, ->(user) { where(user_id: user.id) }
end

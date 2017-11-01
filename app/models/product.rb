class Product < ApplicationRecord
  belongs_to :user
  has_many :ingredients_set, foreign_key: "ingredient_id", class_name: "Ingredient"
  has_many :recipes

  after_initialize :set_defaults

  validates_presence_of :name, :user_id, :ingredients, :amount_type, :unit_type

  validates :product_price, :product_cost, :ingredients_amount_per_recipe, :ingredients_cost_per_unit, :min_amount, presence: true, numericality: { greater_than: 0.0 }

  validates :amount, presence: true, numericality: { greater_than_or_equal_to: 0.0 }

  scope :products_by, ->(user) { where(user_id: user.id ) }

  private
    def set_defaults
      self.amount ||= 0
    end
end

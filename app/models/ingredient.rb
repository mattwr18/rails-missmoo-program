class Ingredient < ApplicationRecord
has_many :products

validates_presence_of :name, :amount, :amount_type, :min_amount

validates :amount, :min_amount, numericality: { greater_than: 0.0 }

end

class Product < ApplicationRecord
  belongs_to :user
  has_many :ingredients

  validates_presence_of :name, :amount, :price, :cost, :user_id

  validates :amount, :price, :cost, numericality: { greater_than: 0.0 }

  scope :products_by, ->(user) { where(user_id: user.id) }
end

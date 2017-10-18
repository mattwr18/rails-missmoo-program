class Product < ApplicationRecord
  belongs_to :user
  has_many :ingredients
  has_many :recipes

  validates_presence_of :name, :user_id

  validates :amount, :price, :cost, presence: true, numericality: { greater_than: 0.0 }

  scope :products_by, ->(user) { where(user_id: user.id) }
end

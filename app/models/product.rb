class Product < ApplicationRecord
  attr_accessor :ingredients_attributes
  belongs_to :user
  has_many :ingredients, inverse_of: :product
  #has_and_belongs_to_many :ingredients
  has_many :recipes
  accepts_nested_attributes_for :ingredients

  after_initialize :set_defaults

  validates_presence_of :name, :user_id

  validates :price, :cost, presence: true, numericality: { greater_than: 0.0 }

  validates :amount, presence: true, numericality: { greater_than_or_equal_to: 0.0 }

  scope :products_by, ->(user) { where(user_id: user.id ) }

  private
    def set_defaults
      self.amount ||= 0
    end
end

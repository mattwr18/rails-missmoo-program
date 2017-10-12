class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :products
  has_many :ingredients

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  after_initialize :set_defaults

  validates_presence_of :first_name, :last_name

  validates :username, uniqueness: true, presence: true, format: { with: /\A[a-zA-Z]+([a-zA-Z]|\d)*\z/ }

  private

    def set_defaults
      self.role ||= 'user'
    end
end

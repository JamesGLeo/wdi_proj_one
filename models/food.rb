class Food < ActiveRecord::Base
  has_many :orders
  has_many :parties, :through => :orders

  # validates :dishname, :course, :price, presence: true
  validates :dishname, uniqueness: true
  # validates :price, :calories, numericality: {only_integer: true}
end
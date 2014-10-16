class Order < ActiveRecord::Base
  belongs_to :food
  belongs_to :party

  validates :food_id, presence: true
end
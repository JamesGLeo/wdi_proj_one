class Party < ActiveRecord::Base
  has_many :orders
  has_many :parties, :through => :orders  

  validates :assigned_table, :groupsize, presence: true
  validates :assigned_table, uniqueness: true
end

class Order < ActiveRecord::Base
  belongs_to :team
  has_many :user_order_costs
  has_many :users, through: :user_order_costs
end

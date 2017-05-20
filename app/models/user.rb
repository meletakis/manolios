class User < ActiveRecord::Base
  has_many :user_team_balances
  has_many :teams, through: :user_team_balances
  has_many :user_order_costs
  has_many :orders, through: :user_order_costs
end

class User < ActiveRecord::Base
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  has_many :user_team_balances
  has_many :teams, through: :user_team_balances
  has_many :user_order_costs
  has_many :orders, through: :user_order_costs
end

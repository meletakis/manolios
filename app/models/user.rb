class User < ActiveRecord::Base
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  has_many :user_team_balances, dependent: :delete_all
  has_many :teams, through: :user_team_balances
  
  has_many :user_order_costs, dependent: :delete_all
  has_many :orders, through: :user_order_costs

  scope :all_except, ->(user) { where.not(id: user) }
end

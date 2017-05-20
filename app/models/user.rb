class User < ActiveRecord::Base
  has_many :user_team_balances
  has_many :teams, through: :user_team_balances
end

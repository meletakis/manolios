class Team < ActiveRecord::Base
  has_many :user_team_balances
  has_many :users, through: :user_team_balances
end
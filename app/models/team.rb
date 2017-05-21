class Team < ActiveRecord::Base
  before_create :default_balance

  has_many :user_team_balances
  has_many :users, through: :user_team_balances
  has_many :orders

  private
    def default_balance
      self.balance = 0.0
    end
end
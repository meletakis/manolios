class AddUserTeamAssociation < ActiveRecord::Migration
  def change
    add_reference :user_team_balances, :user, index: true
    add_reference :user_team_balances, :team, index: true
  end
end

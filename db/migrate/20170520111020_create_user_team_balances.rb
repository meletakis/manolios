class CreateUserTeamBalances < ActiveRecord::Migration
  def change
    create_table :user_team_balances do |t|
      t.decimal :balance

      t.timestamps null: false
    end
  end
end

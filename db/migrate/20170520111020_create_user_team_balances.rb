class CreateUserTeamBalances < ActiveRecord::Migration
  def change
    create_table :user_team_balances do |t|
      t.references :user, index: true, foreign_key: true
      t.references :team, index: true, foreign_key: true
      t.decimal :balance, :default => 0.0

      t.timestamps null: false
    end
  end
end

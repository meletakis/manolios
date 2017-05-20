class CreateUserOrderCosts < ActiveRecord::Migration
  def change
    create_table :user_order_costs do |t|
      t.references :user, index: true, foreign_key: true
      t.references :team, index: true, foreign_key: true
      t.decimal :cost

      t.timestamps null: false
    end
  end
end

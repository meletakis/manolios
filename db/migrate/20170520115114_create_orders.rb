class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.references :team, index: true, foreign_key: true
      t.decimal :cost

      t.timestamps null: false
    end
  end
end

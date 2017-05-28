class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.references :team, index: true, foreign_key: true
      t.decimal :cost, :default => 0.0

      t.timestamps null: false
    end
  end
end

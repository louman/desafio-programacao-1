class CreateOrderItems < ActiveRecord::Migration
  def change
    create_table :order_items do |t|
      t.belongs_to :order, index: true
      t.decimal :unit_price, { precision: 10, scale: 2 }
      t.integer :quantity
      t.string :description
      t.timestamps null: false
    end
  end
end

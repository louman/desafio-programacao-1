class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.belongs_to :upload, index: true
      t.decimal :total, { precision: 10, scale: 2 }
      t.string :customer_name
      t.string :merchant_address
      t.string :merchant_name
      t.timestamps null: false
    end
  end
end

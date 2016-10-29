class CreateOrderDetails < ActiveRecord::Migration[5.0]
  def change
    create_table :order_details do |t|
      t.integer :ticket_id
      t.references :order, foreign_key: true
      t.integer :quantity

      t.timestamps
    end
  end
end

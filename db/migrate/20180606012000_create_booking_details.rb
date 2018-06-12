class CreateBookingDetails < ActiveRecord::Migration[5.0]
  def change
    create_table :booking_details do |t|
      t.integer :price
      t.integer :quantity
      t.references :booking, foreign_key: true
      t.references :dish, foreign_key: true

      t.timestamps
    end
  end
end

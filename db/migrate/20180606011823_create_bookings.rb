class CreateBookings < ActiveRecord::Migration[5.0]
  def change
    create_table :bookings do |t|
      t.datetime :time_start
      t.datetime :time_end
      t.integer :price_table
      t.integer :status
      t.references :table, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end

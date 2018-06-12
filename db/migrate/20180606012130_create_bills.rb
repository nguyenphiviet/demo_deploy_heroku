class CreateBills < ActiveRecord::Migration[5.0]
  def change
    create_table :bills do |t|
      t.integer :total_amount
      t.string :note
      t.references :booking, foreign_key: true
      t.references :customer, foreign_key: true

      t.timestamps
    end
  end
end

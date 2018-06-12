class CreateRatings < ActiveRecord::Migration[5.0]
  def change
    create_table :ratings do |t|
      t.integer :point
      t.references :user, foreign_key: true
      t.references :dish, foreign_key: true

      t.timestamps
    end
  end
end

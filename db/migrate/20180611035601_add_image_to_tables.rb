class AddImageToTables < ActiveRecord::Migration[5.1]
  def change
    add_column :tables, :image, :string
  end
end

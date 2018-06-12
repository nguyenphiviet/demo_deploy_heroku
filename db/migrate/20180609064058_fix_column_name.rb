class FixColumnName < ActiveRecord::Migration[5.0]
  def change
    rename_column :tables, :type, :type_table
  end
end

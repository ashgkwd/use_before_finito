class AddNameToItem < ActiveRecord::Migration[7.1]
  def change
    add_column :items, :name, :string, null: false
    add_column :items, :archived, :bool, null: false, default: false

    add_index :items, :archived
  end
end

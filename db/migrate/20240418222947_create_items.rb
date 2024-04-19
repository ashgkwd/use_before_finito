class CreateItems < ActiveRecord::Migration[7.1]
  def change
    create_table :items do |t|
      t.date :expired_at, null: false

      t.timestamps
    end

    add_index :items, :expired_at
  end
end

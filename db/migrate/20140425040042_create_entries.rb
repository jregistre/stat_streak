class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.decimal :weight, :precision => 2, :scale => 8
      t.integer :user_id

      t.timestamps
    end
    add_index :entries, [:user_id, :created_at]
  end
end

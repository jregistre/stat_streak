class AddStatsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :weight, :float
    add_column :users, :height_ft, :integer
    add_column :users, :height_in, :integer
    add_column :users, :sex, :string
    add_column :users, :target_weight, :float
  end
end

class AddPrevToUsers < ActiveRecord::Migration
  def change
    add_column :users, :prev, :integer
  end
end

class CreateChats < ActiveRecord::Migration
  def change
    create_table :chats do |t|
      t.string :text
      t.integer :user_id

      t.timestamps
    end
  end
end

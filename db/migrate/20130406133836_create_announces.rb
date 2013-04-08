class CreateAnnounces < ActiveRecord::Migration
  def change
    create_table :announces do |t|
      t.string :title
      t.text :body
      t.integer :user_id
      t.integer :prev

      t.timestamps
    end
  end
end

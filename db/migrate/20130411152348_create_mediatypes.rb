class CreateMediatypes < ActiveRecord::Migration
  def change
    create_table :mediatypes do |t|
      t.string :name

      t.timestamps
    end
  end
end

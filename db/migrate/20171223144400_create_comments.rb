class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|

      t.timestamps
      t.text :content
      t.integer :restaurant_id
      t.integer :user_id
    end
  end
end

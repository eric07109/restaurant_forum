class AddPrivateInfoToUsers < ActiveRecord::Migration[5.1]
  def change
  	add_column :users, :gender, :string
  	add_column :users, :age, :integer
  	add_column :users, :region, :string
  	add_column :users, :phone, :string
  end
end

class AddFavouritesCountToRestaurant < ActiveRecord::Migration[5.1]
  def up
  	add_column :restaurants, :favourites_count, :integer, :default => 0

  	Restaurant.reset_column_information
  	Restaurant.find_each do |r|
  		Restaurant.reset_counters r.id, :favourites
  	end
  end

  def down
  	remove_column :restaurants, :favourites_count
  end
end

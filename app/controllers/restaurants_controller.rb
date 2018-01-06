class RestaurantsController < ApplicationController
	before_action :set_user, only: [:show, :dashboard, :favourite, :unfavourite]

	def index
		@restaurants = Restaurant.page(params[:page]).per(9)
		@categories = Category.all
	end
	
	def show
		@comment = Comment.new
	end

	def feeds
		@recent_restaurants = Restaurant.order(created_at: :desc).limit(10)
		@recent_comments= Comment.order(created_at: :desc).limit(10)
	end

	def dashboard
	end

	def favourite
		Favourite.create(restaurant: @restaurant, user: current_user)
		redirect_back(fallback_location: root_path)
	end

	def unfavourite
		Favourite.where(restaurant: @restaurant, user: current_user).destroy_all
		redirect_back(fallback_location: root_path)
	end


	private
	def set_user
		@restaurant = Restaurant.find(params[:id])
	end
end

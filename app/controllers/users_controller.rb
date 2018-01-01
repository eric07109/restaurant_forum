class UsersController < ApplicationController
	before_action :set_user, only: [:show, :update, :edit]

	def show
		@commented_restaurants = @user.restaurants.uniq
	end

	def edit
	end

	def update
		if current_user != @user
			redirect_to user_path(current_user)
			flash[:alert] = "you cannot edit someone else profile"
		end

		if @user.update!(user_params)
			redirect_to user_path(@user)
			flash[:notice] = "user was successfully updated"
		else
			redirect_to user_path(@user)
			flash[:alert] = "user cannot be updated because you missed some fields"
		end
	end

	private
	def user_params
		params.require(:user).permit(:name, :intro, :avatar)
	end

	def set_user
		@user = User.find(params[:id])
	end


end

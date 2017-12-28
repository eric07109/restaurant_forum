class UsersController < ApplicationController
	before_action :set_user, only: [:show, :update, :edit]

	def show
	end

	def edit
	end

	def update
		if current_user != @user
			redirect_to user_path(current_user)
			flash[:alert] = "you cannot edit someone else profile"
		else
			@user.update(user_params)
			redirect_to user_path(@user)
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

class FriendshipsController < ApplicationController
	def create
		@friendship = current_user.friendships.build(friend_id: params[:friend_id])

		if @friendship.save
			flash[:notice] = "Friendship added"
			redirect_back(fallback_location: root_path)
		else
			flash[:alert] = @friendship.errors.full_messages.to_sentence
			redirect_back(fallback_location: root_path)
		end
	end

	def destroy
		@friendship = current_user.friendships.where(friend_id: params[:id]).first

		if @friendship.nil?
			flash[:alert] = "Friendship cannot be deleted because it does not exist"
			redirect_back(fallback_location: root_path)
		else
			@friendship.destroy
			flash[:alert] = "Friendship destroyed"
			redirect_back(fallback_location: root_path)
		end

	end
end

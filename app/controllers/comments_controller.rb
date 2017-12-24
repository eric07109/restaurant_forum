class CommentsController < ApplicationController

	def create
		@restaurant = Restaurant.find(params[:restaurant_id])
		@comment = @restaurant.comments.build(comment_params)
		@comment.user = current_user
		@comment.save!
		redirect_to restaurant_path(@restaurant)
	end

	#can a user submit comments more than 1 time to the same restaurant?
	
	private

	def comment_params
		params.require(:comment).permit(:content)
	end

end

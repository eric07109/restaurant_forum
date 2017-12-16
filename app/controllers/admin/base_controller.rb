class Admin::BaseController < ApplicationController
	before_action :authenticate_admin

  	def authenticate_admin
	  	unless current_user.admin?
	  		flash[:alert] = "Not allowed"
	  		redirect_to root_path
	  	end
  	end
end

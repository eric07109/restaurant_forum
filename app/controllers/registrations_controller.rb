class RegistrationsController < Devise::RegistrationsController
	private

	def sign_up_params
		params.require(:user).permit(:email, :name, :password)
	end

	def account_update_params
		params.require(:user).permit(:email, :name, :password)
	end

end

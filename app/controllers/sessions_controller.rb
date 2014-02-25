class SessionsController < ApplicationController

	def new
	end

	def create
		user = User.find_by(email: params[:session][:email].downcase)
		if user && user.authenticate(params[:session][:password])
			# sign the user in and redirect to the user's show page
			sign_in user
			redirect_to user
		else
			# create and error message and re-render the signin form
			flash.now[:error] = 'Invalid email/password combination' #not quite right
			render 'new'
		end
	end

	def destroy
		sign_out if signed_in?
		redirect_to '/signin'
	end


end
